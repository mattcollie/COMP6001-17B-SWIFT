//
//  ViewController.swift
//  scanR
//
//  Created by #MEMETEAM on 13/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var session: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create a session object.
        session = AVCaptureSession()
        
        // Set the captureDevice.
        let videoCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        // Create input object.
        let videoInput: AVCaptureDeviceInput?
        // Create output object.
        let metadataOutput = AVCaptureMetadataOutput()
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        // Add input to the session.
        if (session.canAddInput(videoInput)) {
            session.addInput(videoInput)
        } else {
            scanningNotPossible()
        }
        
        // Add output to the session.
        if (session.canAddOutput(metadataOutput)) {
            session.addOutput(metadataOutput)
            
            // Send captured data to the delegate object via a serial queue.
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            // Set barcode type for which to scan: Code 39.
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeCode39Code]
            
        } else {
            scanningNotPossible()
        }
        
        // Add previewLayer and have it show the video data.
        previewLayer = AVCaptureVideoPreviewLayer(session: session);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        view.layer.addSublayer(previewLayer);
        
        // Begin the capture session.
        session.startRunning()
        
    }
    
    func scanningNotPossible() {
        // Let the user know that scanning isn't possible with the current device.
        let alert = UIAlertController(title: "Can't Scan.", message: "Please Allow Camera Access", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        session = nil
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        // Get the first object from the metadataObjects array.
        if let barcodeData = metadataObjects.first {
            // Turn it into machine readable code
            let barcodeReadable = barcodeData as? AVMetadataMachineReadableCodeObject;
            if let readableCode = barcodeReadable {
                // Send the barcode as a string to barcodeDetected()
                barcodeDetected(code: readableCode.stringValue);
            }
            
            // Vibrate the device to give the user some feedback.
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            // Avoid a very buzzy device.
            session.stopRunning()
        }
    }
    
    func barcodeDetected(code: String) {
        
        // Let the user know we've found something.
        let alert = UIAlertController(title: "Found a Barcode!", message: code, preferredStyle: UIAlertControllerStyle.alert)
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if (session?.isRunning == false) {
            session.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (session?.isRunning == true) {
            session.stopRunning()
        }
    }

    }

    func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



