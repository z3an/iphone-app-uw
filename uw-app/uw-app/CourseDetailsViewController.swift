//
//  CourseDetailsViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-11-14.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //@IBOutlet weak var catalogLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var sectionTable: UITableView!
    
    var sectionList = [String]()
    var classInfoList: JSON = CourseSearchViewController.classInfoList
    var descriptionData: String = CourseSearchViewController.courseDescription
    var courseCatalog: String = ""
    var courseTitle: String = ""
    
    var selectedRowIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.clipsToBounds = true
        //descriptionTextView.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        sectionTable.layer.cornerRadius = 10
        sectionTable.clipsToBounds = true
        //sectionTable.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        
        
        
        getSectionCatalog(jsonData: self.classInfoList.array![0])
        self.title = courseCatalog
        //catalogLabel.text = courseCatalog
        getSectionTitle(jsonData: self.classInfoList.array![0])
        titleLabel.text = courseTitle
        descriptionTextView.text = descriptionData

        getSectionList()
        //print(self.courseCatalog)
        //print(self.courseTitle)
        //print(self.descriptionData)
        //var tmp = getSectionInstructor(jsonData: self.classInfoList.array![0])
        //print(tmp[1][1])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // get location
    func getSectionLocation(jsonData:JSON) -> Array<String>
    {
        var courseLocation = [String]()
        let classes = jsonData["classes"].array!
        for classData in classes{
            if classData["date"]["is_tba"].bool!{}
            else{
                courseLocation.append(classData["location"]["building"].string! + " " + classData["location"]["room"].string!)
            }
        }
        return courseLocation
    }
    // get instructors
    func getSectionInstructor(jsonData:JSON) -> [[String]]
    {
        var courseInstructor = [[String]]()
        let classes = jsonData["classes"].array!
        for classData in classes{
            let instructors = classData["instructors"].array!
            var instructorsArray = [String]()
            for instructor in instructors{
                instructorsArray.append(instructor.string!)
            }
            courseInstructor.append(instructorsArray)
        }
        return courseInstructor
    }

    //sectionTable
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "sectionCell")
        sectionCell.textLabel?.text = sectionList[indexPath.row]
        return sectionCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowIndex = indexPath.row
        performSegue(withIdentifier: "section_details", sender: self)
    }
    
    
    
    
    // API
    // get section number
    func getSectionList(){
        for sectionJSON in self.classInfoList.array!{
            if self.sectionList.contains(sectionJSON["section"].string!){
                print("Error! This should never happen")
            }
            else{
                var cell: String = ""
                let sectionNumber:String = sectionJSON["section"].string!
                cell += sectionNumber
                
                
                
                
                
                
                
                
                
                
                self.sectionList.append(cell)
            }
        }
    }
    
    // get the course catalog of section
    func getSectionCatalog(jsonData:JSON)
    {
        self.courseCatalog = jsonData["subject"].string! + " " + jsonData["catalog_number"].string!
    }
    // get the course title of section
    func getSectionTitle(jsonData:JSON)
    {
        self.courseTitle = jsonData["title"].string!
    }
    // get the units of section most of them are 0.5
    func getSectionUnits(jsonData:JSON) -> String
    {
        return  String(jsonData["units"].double!)
    }
    // get the level of section
    func getSectionLevel(jsonData:JSON) -> String
    {
        return jsonData["academic_level"].string!
    }
    // get course number of section
    func getSectionCourseNumber(jsonData:JSON) -> String
    {
        return String(jsonData["class_number"].integer!)
    }
    // get notes of section
    func getSectionNote(jsonData:JSON) -> String
    {
        return jsonData["note"].string!
    }
    // get campus of section
    func getSectionCampus(jsonData:JSON) -> String
    {
        return jsonData["campus"].string!
    }
    // get associated class of section
    func getSectionAssociatedClass(jsonData:JSON) -> String
    {
        return String(jsonData["associated_class"].integer!)
    }
    // get related_componet_1 of section
    func getSectionRelatedComponent1(jsonData:JSON) -> String
    {
        return jsonData["related_component_1"].string!
    }
    // get related_componet_2 of section
    func getSectionRelatedComponent2(jsonData:JSON) -> String
    {
        return jsonData["related_component_2"].string!
    }
    // get enrollment capacity of section
    func getSectionEnrollmentCapacity(jsonData:JSON) -> String
    {
        return String(jsonData["enrollment_capacity"].integer!)
    }
    // get enrollment total of section
    func getSectionEnrollmentTotal(jsonData:JSON) -> String
    {
        return String(jsonData["enrollment_total"].integer!)
    }
    // get wait cap
    func getSectionWaitingCapacity(jsonData:JSON) -> String
    {
        return String(jsonData["waiting_capacity"].integer!)
    }
    // get wait total
    func getSectionWaitingTotal(jsonData:JSON) -> String
    {
        return String(jsonData["waiting_total"].integer!)
    }
    // get time days time
    func getSectionTime(jsonData:JSON) -> Array<String>
    {
        var courseTime = [String]()
        let classes = jsonData["classes"].array!
        for classData in classes{
            if classData["date"]["is_tba"].bool!{
                courseTime.append("TBA")
            }
                // is_cancelled  and is_closed
            else{
                courseTime.append(classData["date"]["start_time"].string! + "-" + classData["date"]["end_time"].string! + classData["date"]["weekdays"].string!)
            }
        }
        return courseTime
    }
}
