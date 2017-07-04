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
    var url: String = ""
    
    @IBAction func submitButton(_ sender: Any) {
        
        buildUrl()

        if let website = URL(string: url) {
            print(website)
            let request = NSMutableURLRequest(url: website)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error)
                    
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        if (dataString?.contains("phrase"))! {
                            DispatchQueue.main.sync(execute: {
                                self.weatherLabel.text = "Forecast found"
                            })
                        } else {
                            DispatchQueue.main.sync(execute: {
                                self.weatherLabel.text = "Forecast not found"
                            })
                        }
                        
                    }
                }
            }
            
            task.resume()
            
        } else {
            print("Invalid website URL")
        }
    }
    
    func buildUrl() {
        let userUrl = textField.text
        url = (userUrl?.replacingOccurrences(of: " ", with: "-"))!
        url = "http://www.weather-forecast.com/locations/" + url + "/forecasts/latest"
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

