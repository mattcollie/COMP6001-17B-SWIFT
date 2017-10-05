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
        SetDayOfWeek()
        if let item = item {
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
    
    func GetDayOfWeek() -> Int{
        switch(lblDay.text!){
        case "Monday":
            return 1
        case "Tuesday":
            return 2
        case "Wednesday":
            return 3
        case "Thursday":
            return 4
        case "Friday":
            return 5
            
        default:
            return 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func lblDayChanged(_ sender: UITextField) {
        if lblDay.text != nil{
            item?.Day = GetDayOfWeek()
        }
    }
    @IBAction func lblPaperChanged(_ sender: UITextField) {
        item?.PaperName = lblPaper.text!
    }
    @IBAction func lblRoomChanged(_ sender: UITextField) {
        item?.ClassName = lblRoom.text!
    }
    @IBAction func lblHourChanged(_ sender: UITextField) {
        item?.Hour = Int(lblHour.text!)!
    }
    @IBAction func lblDurationChanged(_ sender: UITextField) {
        item?.DurationMinutes = Int(lblDuration.text!)!
    }
    @IBAction func lblClassTypeChanged(_ sender: UITextField) {
        item?.ClassType = lblClassType.text!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if lblDay.text != nil{
            item?.Day = GetDayOfWeek()
        }
        item?.PaperName = lblPaper.text!
        item?.ClassName = lblRoom.text!
        item?.Hour = Int(lblHour.text!)!
        item?.DurationMinutes = Int(lblDuration.text!)!
        item?.ClassType = lblClassType.text!
        
        super.prepare(for: segue, sender: sender)
    }
    

}
