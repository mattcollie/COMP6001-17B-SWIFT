import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
 
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var cameraView: UIView!
    
    @IBAction func unwindToCamera(unwindSegue: UIStoryboardSegue) {
    }
    
    var session: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var barcode = Int64()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boxView.layer.borderColor = UIColor.white.cgColor
        boxView.layer.borderWidth = 3
        boxView.layer.cornerRadius = 10
        
        startCamera()
    }
    
    func startCamera() {
        // Create a session object.
        session = AVCaptureSession()
        
        // Set the captureDevice.
        
        let videoCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        // Create input object.
        let videoInput: AVCaptureDeviceInput?
        
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
        
        // Create output object.
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        // Add output to the session.
        
        if (session.canAddOutput(metadataOutput)) {
            session.addOutput(metadataOutput)
            
            // Send captured data to the delegate object via a serial queue.
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeCode39Code]
            
        } else {
            scanningNotPossible()
        }
        
        // Add previewLayer and have it show the video data.
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        cameraView.layer.addSublayer(previewLayer);
        
        // Begin the capture session.
        
        session.startRunning()
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
    
    func scanningNotPossible() {
        
        // Let the user know that scanning isn't possible with the current device.
        
        let alert = UIAlertController(title: "Can't Scan.", message: "Let's try a device equipped with a camera.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        session = nil
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        // Get the first object from the metadataObjects array.
        
        if let barcodeData = metadataObjects.first {
            
            // Turn it into machine readable code
            
            let barcodeReadable = barcodeData as? AVMetadataMachineReadableCodeObject;
            
            if let readableCode = barcodeReadable {
                
                // Send the barcode as a string to barcodeDetected()
                
                barcodeDetected(readableCode.stringValue);
            }
            
            // Vibrate the device to give the user some feedback.
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            // Avoid a very buzzy device.
            
            session.stopRunning()
        }
    }
    
    func barcodeDetected(_ code: String) {
        barcode = Int64(Int(code)!)
        
        // Let the user know we've found something.
        let alert = UIAlertController(title: "Found a Barcode!", message: "Card Number: \(code)", preferredStyle: UIAlertControllerStyle.alert)
        //API call here to check if user is registered
        //if user is registered:
        alert.addAction(UIAlertAction(title: "View Timetable", style: .default, handler: {(uiAlert) in
            self.segueTimetable()
        })) //goes to cody's page - displays timetable
        //else:
        alert.addAction(UIAlertAction(title: "Register New Student", style: .default, handler: nil)) //goes to add timetable page
        //dismiss alert and restart capture session
        alert.addAction(UIAlertAction(title: "Scan Another Card", style: .default, handler: { (UIAlert) in
            self.startCamera()
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func InfoButtonClick(_ sender: Any) {
        let secondViewController = InfoController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func segueTimetable() {
        performSegue(withIdentifier: "showTimetable", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTimetable" {
            guard let itemDetailViewController = segue.destination as? TimeTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            itemDetailViewController.barcodeNumber = barcode
        }
    }
}




