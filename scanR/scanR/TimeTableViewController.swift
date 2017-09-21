//
//  TimeTableViewController.swift
//  scanR
//
//  Created by #MEMETEAM on 21/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import UIKit

class TimeTableViewController: UITableViewController {

    var foos = [Foo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func loadData(){
        
        let currentDate = "0900"
        
        guard let time1 = Foo(code: "COMP6008", room: "DT308", time: currentDate) else{
            fatalError("Unable to instantiate time1")
        }
        
        guard let time2 = Foo(code: "COMP6008", room: "DT308", time: currentDate) else{
            fatalError("Unable to instantiate time1")
        }
        
        guard let time3 = Foo(code: "COMP6008", room: "DT308", time: currentDate) else{
            fatalError("Unable to instantiate time1")
        }
        
        guard let time4 = Foo(code: "COMP6008", room: "DT308", time: currentDate) else{
            fatalError("Unable to instantiate time1")
        }
        
        guard let time5 = Foo(code: "COMP6008", room: "DT308", time: currentDate) else{
            fatalError("Unable to instantiate time1")
        }
        
        foos += [time1, time2, time3, time4, time5]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath) as? TimeTableViewCell else {
            fatalError("The dequeued cell is not an instance of TimeTableViewCell")
        }
       let foo = foos[indexPath.row]    //this will give us the meal we want to display in the cell
         
         cell.classLabel.text = foo.code     //this will set properties in the cell
         cell.roomLabel.text = foo.room
         cell.timeLabel.text = foo.time
         
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "Section \(section)"
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}