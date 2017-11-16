//
//  ViewController.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-09-09.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("gg")
        // Do any additional setup after loading the view, typically from a nib.
        
        WatSwift.FoodServices.menu { response in
            // metadata returned by the API, wrapped in a Metadata struct
            let metadata = response.metadata
            // Data returned by the API in JSON format.
            let data: JSON = response.data
            // ...
            if let outletname = data["outlets"][0]["outlet_name"].string{
                print(outletname)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

