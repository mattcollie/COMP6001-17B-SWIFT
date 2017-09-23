//
//  TimeTableDetailViewController.swift
//  scanR
//
//  Created by Geoff Dev on 23/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import UIKit

class TimeTableDetailViewController: UIViewController {
    @IBOutlet weak var txtDay: UITextField!
    @IBOutlet weak var txtPaperCode: UITextField!
    @IBOutlet weak var txtRoom: UITextField!
    @IBOutlet weak var dateStart: UIDatePicker!
    @IBOutlet weak var dateEnd: UIDatePicker!

    var item: Foo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            txtDay.text = item.time
            txtPaperCode.text = item.code
            txtRoom.text = item.room
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
