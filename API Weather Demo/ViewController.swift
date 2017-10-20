// comitted
//  ViewController.swift
//  API Weather Demo
//
//  Created by George Garcia on 7/10/17.
//  Copyright © 2017 George. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=acb17a17d84d1990c485fe36ea632646")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
             
                if let urlContent = data {
                   
                    do{
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                    print(jsonResult)
                        print(jsonResult["name"])
                        
                        if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                            
                            print(description)
                            
                        }
                    
                    } catch{
                        
                        print("JSON Processing Failed")
                    }
                
            }
            
        }
        
        
    }
        
        task.resume()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

