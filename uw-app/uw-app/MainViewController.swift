//
//  ViewController.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-09-09.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static var previousTermId = Int()
    static var currentTermId = Int()
    static var nextTermId = Int()
    static var termData = JSON(AnyObject.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initialize term api
        WatSwift.Terms.listAll { response in
            let term_data: JSON = response.data
            ViewController.termData = term_data
//            if let termId = term_data["previous_term"].integer {
//                ViewController.previousTermId = termId
//            }
//            if let termId = term_data["current_term"].integer {
//                ViewController.currentTermId = termId
//            }
//            if let termId = term_data["next_term"].integer {
//                ViewController.nextTermId = termId
//            }
        }
        
        // initialize subject api
        // TODO
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

