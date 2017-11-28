//
//  CourseDetailsViewController.swift
//  uw-app
//
//  Created by Guyu Li on 2017-11-14.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sectionList = [String]()
    var classInfoList = CourseSearchViewController.classInfoList
    var descriptionData = CourseSearchViewController.courseDescription
    var courseCatalog: String = ""
    var courseTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getSectionList()
        getSectionTitle(jsonData: self.classInfoList.array![0])
        getSectionCatalog(jsonData: self.classInfoList.array![0])
        print(self.courseCatalog)
        print(self.courseTitle)
        print(self.descriptionData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSectionList(){
        for sectionJSON in self.classInfoList.array!{
            if self.sectionList.contains(sectionJSON["section"].string!){
                print("Error! This should never happen")
            }
            else{
                self.sectionList.append(sectionJSON["section"].string!)
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
    
    // get the units of section
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //sectionTable
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "sectionCell")
        sectionCell.textLabel?.text = sectionList[indexPath.row]
        return sectionCell
    }
    
    
}
