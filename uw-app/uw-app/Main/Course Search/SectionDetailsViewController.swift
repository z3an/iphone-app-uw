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
    @IBOutlet weak var RMFButton: UIButton!
    
    @IBOutlet weak var classTimeTextBox: UITextField!
    @IBOutlet weak var locationTextBox: UITextField!
    @IBOutlet weak var instructorTextBox: UITextField!
    
    let section = SectionClass()
    static var firstInstructor:String = ""
    var ifAdded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = CourseDetailsViewController.selectedSectionNumber
        
        addScheduleButton.layer.cornerRadius = 10
        addScheduleButton.clipsToBounds = true
        RMFButton.layer.cornerRadius = 10
        RMFButton.clipsToBounds = true
        
        // set section datetime
        let datetimeLen: Int = CourseDetailsViewController.selectedDatetime.count
        var i = 0
        for dateTime: String in CourseDetailsViewController.selectedDatetime {
            i += 1
            classTimeTextBox.text = classTimeTextBox.text! + dateTime
            if i < datetimeLen {
                classTimeTextBox.text = classTimeTextBox.text! + " | "
            }
        }
        
        // set section location
        let locationLen: Int = CourseDetailsViewController.selectedLocation.count
        i = 0
        for location: String in CourseDetailsViewController.selectedLocation {
            i += 1
            locationTextBox.text = locationTextBox.text! + location
            if i < locationLen {
                locationTextBox.text = locationTextBox.text! + " | "
            }
        }
        
        // set section instructor
        for instructorArray: Array<String> in CourseDetailsViewController.selectedInstructor {
            for instructor: String in instructorArray {
                instructorTextBox.text = instructorTextBox.text! + instructor + " "
                
                if SectionDetailsViewController.firstInstructor == "" {
                    SectionDetailsViewController.firstInstructor = instructor
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func RMPAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "rmp", sender: self)
    }

    @IBAction func AddScheduleAction(_ sender: Any) {
        if ifAdded == false {
            section.courseCatalog = CourseDetailsViewController.courseCatalog
            section.courseTitle = CourseDetailsViewController.courseTitle
            section.sectionNumber = CourseDetailsViewController.selectedSectionNumber
            section.datetime = CourseDetailsViewController.selectedDatetime
            section.instructor = CourseDetailsViewController.selectedInstructor
            section.location = CourseDetailsViewController.selectedLocation
            //check time conflict
            let bool = Utilities.sectionTimeConflict(section: section)
            print(bool)
            ViewController.addedSection.append(section)
            addScheduleButton.setTitle("Remove from Your Schedule", for: .normal)
            ifAdded = true
        }
        else {
            addScheduleButton.setTitle("Add to Your Schedule", for: .normal)
            ViewController.addedSection.removeLast()
            ifAdded = false
        }
        
    }
    

}
