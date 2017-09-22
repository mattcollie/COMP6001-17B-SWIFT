//
//  InfoController.swift
//  scanR
//
//  Created by Apple Build 01 on 22/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import UIKit

class InfoController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClose(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }

}
