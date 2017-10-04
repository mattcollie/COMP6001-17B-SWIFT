//
//  TimeTableDetailViewController.swift
//  scanR
//
//  Created by Geoff Dev on 23/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import UIKit

class TimeTableDetailViewController: UIViewController {
    @IBOutlet weak var lblDay: UITextField!
    @IBOutlet weak var lblPaper: UITextField!
    @IBOutlet weak var lblRoom: UITextField!
    @IBOutlet weak var lblHour: UITextField!
    @IBOutlet weak var lblDuration: UITextField!
    @IBOutlet weak var lblClassType: UITextField!
    @IBOutlet weak var lblStudentId: UILabel!

    var item: Timeslot?
    var dayOfWeek = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            SetDayOfWeek()
            lblDay.text = dayOfWeek
            lblPaper.text = item.PaperName
            lblRoom.text = item.ClassName
            lblHour.text = String(item.Hour)
            lblDuration.text = String(item.DurationMinutes)
            lblClassType.text = item.ClassType
        }

        // Do any additional setup after loading the view.
    }
    
    func SetDayOfWeek(){
        guard let day = item?.Day else {
            fatalError("Wrong date!")
        }
        
        switch(day){
            case 1:
                dayOfWeek = "Monday"
            case 2:
                dayOfWeek = "Tuesday"
            case 3:
                dayOfWeek = "Wednesday"
            case 4:
                dayOfWeek = "Thursday"
            case 5:
                dayOfWeek = "Friday"
            
        default:
            dayOfWeek = "To infinty and beyond!"
        }
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
