//
//  TimeTableViewController.swift
//  scanR
//
//  Created by #MEMETEAM on 21/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import UIKit

class TimeTableViewController: UITableViewController {

    var timeSlots = [Timeslot]()
    var barcodeNumber = Int64()
    var studentId = Int64()
    var origin = String()
    var dayOfWeek = ""
    
    @IBAction func unwindToTimetable(sender: UIStoryboardSegue) {
    

    
        guard let identifier = sender.identifier as? String else{
            fatalError("Segue has an unknown identifier: \(sender)")
        }
        
        if (identifier == "Save"){
            if let sourceViewController = sender.source as? TimeTableDetailViewController, let timeSlot = sourceViewController.item{
                TimeslotApi.UpdateTimeslot(timeslot: timeSlot)
            
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    timeSlots[selectedIndexPath.row] = timeSlot
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
            }
        }
    }
    //issue 7 code - Ashton. More in the timeSlotClass.swift file
    @IBAction func saveButtonPressed(_ sender: Any) {
        var tsClassArray = [timeSlotClass.timeSlot] ()
        timeSlots.forEach { timeslot in
            timeSlotClass.createTimeslot(id: timeslot.Id, day: timeslot.Day, hour: timeslot.Hour, durationMinutes: timeslot.DurationMinutes, className: timeslot.ClassName, paperName: timeslot.PaperName, classType: timeslot.ClassType, studentId: timeslot.StudentId)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        barcodeNumber = 100092487
        var student = Student(barcode: barcodeNumber)
        var response = URLResponse()
        var slots = [Timeslot]()

        if origin == "saved" {
            //this is supposed to unencode the encoded stuff and use it instead of the API if the show saved btton is pressed
            guard let slotData = UserDefaults.standard.object(forKey: "timeslots") as? NSData else {
                print("timeslots not found in UserDefaults")
                return
            }
            guard let slots = NSKeyedUnarchiver.unarchiveObject(with: slotData as Data) as? [Timeslot] else {
                print("Could not unarchive from timeslotData")
                return
            }
            self.timeSlots = slots
        }
        else {
            StudentApi.GetByBarcode(id: barcodeNumber, response: { (student, response) -> Void in
                // code here
                self.studentId = (student?.StudentId)!
                TimeslotApi.GetTimeslotsByStudentId(id: self.studentId, response: { (slots, response) -> Void in
                    self.timeSlots = slots!
                    
                })
            })
            self.tableView.reloadData()
        }
        
        
    
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timeSlots.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath) as? TimeTableViewCell else {
            fatalError("The dequeued cell is not an instance of TimeTableViewCell")
        }
       let timeslot = timeSlots[indexPath.row]    //this will give us the meal we want to display in the cell
         SetDay(timeslot.Day)
        
         cell.classLabel.text = timeslot.PaperName     //this will set properties in the cell
         cell.roomLabel.text = timeslot.ClassName
        cell.hourLabel.text = String(timeslot.Hour)
        cell.durationLabel.text = String(timeslot.DurationMinutes)
        cell.dayLabel.text = dayOfWeek
        
         
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "Section \(section)"
    }
    
    func SetDay(_ day: Int){
        
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
            dayOfWeek = "Groundhog day!"
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? ""){
            case "ShowDetail":
                guard let itemDetailViewController = segue.destination as? TimeTableDetailViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
                }
            
                guard let selectedItemCell = sender as? TimeTableViewCell else {
                    fatalError("Unexpected sender: \(sender)")
                }
            
                guard let indexPath = tableView.indexPath(for: selectedItemCell) else {
                        fatalError("The selected cell is not being displayed by the table")
                }
            
                let selectedItem = timeSlots[indexPath.row]
                itemDetailViewController.item = selectedItem
            
            case "":
                guard let cameraViewController = segue.destination as? ViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
                }
            
            
        default:
            fatalError("Unexpected Segue Identifier: \(segue.identifier)")
            
        }
    }
    

}
