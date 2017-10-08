//
//  SearchViewController.swift
//  scanR
//
//  Created by Jeff Kranenburg on 28/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import UIKit // Issue#10 issue/10

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchID(_ sender: Any) {
        var studentId = Int64(searchField.text!)
        var student = Student(id: studentId!)
        var response = URLResponse()
        
        StudentApi.GetByStudentId(id: studentId!) { (student, response) in
            // code here to do many more things
        }
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

