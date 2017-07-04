//
//  ViewController.swift
//  whats-the-weather
//
//  Created by Chanse Campbell on 04/07/2017.
//  Copyright © 2017 Chanse Campbell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var weatherLabel: UILabel!
    
    @IBAction func submitButton(_ sender: Any) {
        buildUrl()
    }
    
    func buildUrl() {
        let userUrl = textField.text
        let url = userUrl?.replacingOccurrences(of: " ", with: "-")
        print("User submitted " + url!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

