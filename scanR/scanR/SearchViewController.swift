//
//  SearchViewController.swift
//  scanR
//
//  Created by Jeff Kranenburg on 28/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if SearchBar.text == nil || SearchBar.text == "" {
            view.endEditing(true)
        }else{
            SearchForStudent(studentId: Int64(searchText)!)
        }
    }
    
    func SearchForStudent(studentId:Int64){
        // call the api to search for a student id
        // do more things after that
        var foo = studentId
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
