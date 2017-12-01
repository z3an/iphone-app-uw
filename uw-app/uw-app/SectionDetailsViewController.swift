//
//  SectionDetailsViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-11-30.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class SectionDetailsViewController: UIViewController {
    @IBOutlet weak var addScheduleButton: UIButton!
    
    @IBOutlet weak var classTimeTextBox: UITextField!
    @IBOutlet weak var locationTextBox: UITextField!
    @IBOutlet weak var instructorTextBox: UITextField!
    
    let section = SectionClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = CourseDetailsViewController.selectedSectionNumber
        for dateTime: String in CourseDetailsViewController.selectedDatetime {
            classTimeTextBox.text = classTimeTextBox.text! + dateTime + " "
        }
        
        for location: String in CourseDetailsViewController.selectedLocation {
            locationTextBox.text = locationTextBox.text! + location + " "
        }
        
        print (CourseDetailsViewController.selectedInstructor)
        
        for instructorArray: Array<String> in CourseDetailsViewController.selectedInstructor {
            for instructor: String in instructorArray {
                instructorTextBox.text = instructorTextBox.text! + instructor + " "
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RMFAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "rmf", sender: self)
        
        // TODO: search for instructor's name
    }
    
    @IBAction func AddScheduleAction(_ sender: Any) {
        section.courseCatalog = CourseDetailsViewController.courseTitle
        section.courseTitle = CourseDetailsViewController.courseTitle
        section.sectionNumber = CourseDetailsViewController.selectedSectionNumber
        section.datetime = CourseDetailsViewController.selectedDatetime
        section.instructor = CourseDetailsViewController.selectedInstructor
        section.location = CourseDetailsViewController.selectedLocation
        ViewController.addedSection.append(section)
        addScheduleButton.isEnabled = false
        // TODO: add remove from schedule button
    }
    

}
