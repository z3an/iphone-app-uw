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
    static var termList = [String]()
    static var lastTermCourse = JSON(AnyObject.self)
    static var currentTermCourse = JSON(AnyObject.self)
    static var nextTermCourse = JSON(AnyObject.self)
    
    static var addedSection = Array<SectionClass>()
    
    func addTermList(){
        // initialize term api
        WatSwift.Terms.listAll { response in
            let term_data: JSON = response.data
            ViewController.termData = term_data
            if let termId = ViewController.termData["previous_term"].integer {
                ViewController.termList.append(String(termId))
            }
            if let termId = ViewController.termData["current_term"].integer {
                ViewController.termList.append(String(termId))
            }
            if let termId = ViewController.termData["next_term"].integer {
                ViewController.termList.append(String(termId))
            }
            self.getTermCourse()
        }
    }
    
    func getTermCourse(){
        // initialize course for each term
        WatSwift.Terms.courses(for: ViewController.termList[0]) { response in
            let course_data: JSON = response.data
            ViewController.lastTermCourse = course_data
        }
        WatSwift.Terms.courses(for: ViewController.termList[1]) { response in
            let course_data: JSON = response.data
            ViewController.currentTermCourse = course_data
        }
        WatSwift.Terms.courses(for: ViewController.termList[2]) { response in
            let course_data: JSON = response.data
            ViewController.nextTermCourse = course_data
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var test = Utilities.convertTo24Hour(oriDateTime: "03:00-04:20TTh")
        
        // Do any additional setup after loading the view, typically from a nib. 
        self.addTermList()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

