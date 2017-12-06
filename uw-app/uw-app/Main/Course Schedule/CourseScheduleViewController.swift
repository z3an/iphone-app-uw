//
//  CourseScheduleViewController.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-12-02.
//  Copyright © 2017 zepengan. All rights reserved.
//

import UIKit
import JTAppleCalendar


let monthTranslate:[String:String] = [
    "January" : "01",
    "February" : "02",
    "March" : "03",
    "April" : "04",
    "May" : "05",
    "June" : "06",
    "July" : "07",
    "August" : "08",
    "September" : "09",
    "October" : "10",
    "November" : "11",
    "December" : "12"
]

let weekdayTranslate:[Int:String] = [
    1 : "Sunday",
    2 : "Monday",
    3 : "Tuesday",
    4 : "Wednesday",
    5 : "Thursday",
    6: "Friday",
    7 : "Saturday",
    8 : "Sunday"
]


class CourseScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    class sectionClassSimple{
        var courseCatalog = ""
        var courseSection = ""
        var lectureString = "LEC - Lecture"
        var courseTitle = ""
        var sectionTime = ""
        var sectionLocation = ""
        var sectionInstructor = ""
    }
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var sectionTable: UITableView!
    
    let outsideMonthColor = UIColor(colorWithHexValue: 0x584a66)
    let monthColor = UIColor.white
    let selectedMonthColor = UIColor(colorWithHexValue: 0x3a294b)
    let currentDateSelectedViewColor = UIColor(colorWithHexValue: 0x4e3f5d)
    var sectionClassList = ViewController.addedSection
    
    let formatter = DateFormatter()
    var mondayClass = [sectionClassSimple]()
    var tuesdayClass = [sectionClassSimple]()
    var wednesdayClass = [sectionClassSimple]()
    var thursdayClass = [sectionClassSimple]()
    var fridayClass = [sectionClassSimple]()
    
    var sectionList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for testing:
        let TestData1 = SectionClass()
        TestData1.courseCatalog = "STAT 340"
        TestData1.courseTitle = "R language"
        TestData1.sectionNumber = "002"
        TestData1.datetime = ["08:30-09:50MWF", "14:30-15:50TTh"]
        TestData1.location = ["STC - Science Teaching Complex 0050", "STC - Science Teaching Complex 0060"]
        TestData1.instructor = [["Paul,An", "Rain,Li"],["Zepeng,An"]]
        let TestData2 = SectionClass()
        TestData2.courseCatalog = "MATH 237"
        TestData2.courseTitle = "Calculus"
        TestData2.sectionNumber = "001"
        TestData2.datetime = ["10:30-11:50MWF", "16:30-17:50TTh"]
        TestData2.location = ["DC - Device Center 1350", "DC - Device Center 1351"]
        TestData2.instructor = [["Paul,An", "Rain,Li"],["Zepeng,An"]]
        self.sectionClassList.append(TestData1)
        self.sectionClassList.append(TestData2)

        // Do any additional setup after loading the view.
        sectionTable.layer.cornerRadius = 10
        sectionTable.clipsToBounds = true
        //courseScheduleText.text = ""
        setupCalendarView()
        
        //generate list
        generateScheduleBasedOnList()
        
    }
    func setupCalendarView(){
        //setup calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        //setup labels
        calendarView.visibleDates{ visibleDates in
            self.setupViewsOfCalendar(from: visibleDates)
        }
        
    }
    func generateScheduleBasedOnList(){
        for sectionClass in self.sectionClassList{
            var locationList = sectionClass.location
            var sectionClassDateTimeList = sectionClass.datetime
            var instructorList = sectionClass.instructor
            for index in 0...(sectionClassDateTimeList.count-1){
                let sectionClassDateTime = sectionClassDateTimeList[index]
                let start = sectionClassDateTime.index(sectionClassDateTime.startIndex, offsetBy:11)
                let weekdates = sectionClassDateTime[start..<sectionClassDateTime.endIndex]
                let classtimeStart = sectionClassDateTime.index(sectionClassDateTime.startIndex, offsetBy: 11)
                let classtime = sectionClassDateTime.prefix(upTo: classtimeStart)
                for i in weekdates.indices{
                    let courseSectionSimple = sectionClassSimple()
                    //get course section time
                    courseSectionSimple.sectionTime = String(classtime)
                    //get courseCatalog
                    courseSectionSimple.courseCatalog = sectionClass.courseCatalog
                    //get course section number
                    courseSectionSimple.courseSection = sectionClass.sectionNumber
                    //get course title
                    courseSectionSimple.courseTitle = sectionClass.courseTitle
                    courseSectionSimple.sectionLocation = locationList[index]
                    let instructors = instructorList[index]
                    for instructorsElement in instructors{
                        courseSectionSimple.sectionInstructor = courseSectionSimple.sectionInstructor + instructorsElement + " "
                    }
                    if String(weekdates[i]) == "M"{
                        //let mondaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        self.mondayClass.append(courseSectionSimple)
                    }
                    else if String(weekdates[i]) == "T" && String(weekdates[weekdates.index(after:i)]) == "h"{
                        //var thursdaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        self.thursdayClass.append(courseSectionSimple)
                    }
                    else if String(weekdates[i]) == "h"{continue}
                    else if String(weekdates[i]) == "T"{
                        //var tuesdaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        self.tuesdayClass.append(courseSectionSimple)
                    }
                    else if String(weekdates[i]) == "W"{
                        //var wednesdaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        self.wednesdayClass.append(courseSectionSimple)
                    }
                    else if String(weekdates[i]) == "F"{
                        //var fridaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        self.fridayClass.append(courseSectionSimple)
                    }
                    else{
                        print("Invalid weekdate")
                    }
                }
            }
        }
        self.mondayClass.sort{ $0.sectionTime < $1.sectionTime }
        self.tuesdayClass.sort{ $0.sectionTime < $1.sectionTime }
        self.wednesdayClass.sort{ $0.sectionTime < $1.sectionTime }
        self.thursdayClass.sort{ $0.sectionTime < $1.sectionTime }
        self.fridayClass.sort{ $0.sectionTime < $1.sectionTime }
    }
    
    
    func handleCelltextColor(view:JTAppleCell?, cellState: CellState){
        guard let validCell = view as? CustomCell else {return}
        if cellState.isSelected{
            validCell.dateLabel.textColor = selectedMonthColor
        }else{
            if cellState.dateBelongsTo == .thisMonth{
                validCell.dateLabel.textColor = monthColor
            }else{
                validCell.dateLabel.textColor = outsideMonthColor
            }
        }
    }
    
    func handleCellSelected(view:JTAppleCell?, cellState: CellState){
        sectionTable.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        guard let validCell = view as? CustomCell else {return}
        if validCell.isSelected{
            validCell.selectedView.isHidden = false
            let selectDateStr = self.year.text! + " " + monthTranslate[self.month.text!]! + " " + validCell.dateLabel.text!
            //print(validCell.dateLabel.text)
            //print(self.year.text)
            //print(self.month.text)
            let formatter  = DateFormatter()
            formatter.dateFormat = "yyyy MM dd"
            let selectDate = formatter.date(from:selectDateStr)
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
            let myComponents = myCalendar.components(.weekday, from: selectDate!)
            let weekDay = myComponents.weekday
            var contents = [sectionClassSimple]()
            //courseScheduleText.text = ""
            sectionList.removeAll()
            if weekdayTranslate[weekDay!] == "Monday"{
                contents = self.mondayClass
            }
            else if weekdayTranslate[weekDay!] == "Tuesday"{
                contents = self.tuesdayClass
            }
            else if weekdayTranslate[weekDay!] == "Wednesday"{
                contents = self.wednesdayClass
            }
            else if weekdayTranslate[weekDay!] == "Thursday"{
                contents = self.thursdayClass
            }
            else if weekdayTranslate[weekDay!] == "Friday"{
                contents = self.fridayClass
            }
            else{
                print("Invalid date")
            }
            for content in contents{
                //let sectionTextBox = UITextView(frame: CGRect(x: 0.0, y: 0.0, width: 400.0, height: 100.0))
                //let sectionTextBox = UITextView()
                //sectionTextBox.frame.size.width = 400.0
                //sectionTextBox.frame.size.height = 100.0
                //sectionTextBox.isScrollEnabled = false
                //self.automaticallyAdjustsScrollViewInsets = false
                //sectionTextBox.center = courseScheduleText.center
                //sectionTextBox.textAlignment = NSTextAlignment.justified
                //sectionTextBox.font = UIFont(name: "NameOfTheFont", size: 20)
                //sectionTextBox.layer.cornerRadius = 10
                //sectionTextBox.clipsToBounds = true
                //sectionTextBox.textColor = UIColor.black
                //sectionTextBox.backgroundColor = UIColor.yellow
                //print (sectionTextBox.text)
                //courseScheduleText.addSubview(sectionTextBox)
                sectionList.append(content.courseCatalog + " - " + content.courseSection + "\n" + content.courseTitle + "\n" + content.lectureString + "\n" + content.sectionTime + "\n" + content.sectionLocation + "\n" + content.sectionInstructor + "\n")
                self.sectionTable.reloadData()
            }
        }else{
            validCell.selectedView.isHidden = true
        }
    }
    
    // section table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "sectionCell")
        sectionCell.textLabel?.text = sectionList[indexPath.row]
        sectionCell.textLabel?.numberOfLines = 0
        sectionCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        return sectionCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "section_details", sender: self)
    }
    
    // add new event action
    @IBAction func AddNewEventAction(_ sender: UIButton) {
        performSegue(withIdentifier: "add_new_event", sender: self)
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo){
        let date = visibleDates.monthDates.first!.date
        self.formatter.dateFormat = "yyyy"
        self.year.text = self.formatter.string(from:date)
        self.formatter.dateFormat = "MMMM"
        self.month.text = self.formatter.string(from:date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CourseScheduleViewController: JTAppleCalendarViewDataSource{
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        let startDate = formatter.date(from:"2017 01 01")!
        let endDate = formatter.date(from:"2020 12 31")!
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
}
extension CourseScheduleViewController: JTAppleCalendarViewDelegate{
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {}
    
    //display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        handleCellSelected(view:cell, cellState: cellState)
        handleCelltextColor(view:cell, cellState: cellState)
        
        return cell
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date:Date, cell:JTAppleCell?, cellState: CellState){
        handleCellSelected(view:cell, cellState: cellState)
        handleCelltextColor(view:cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date:Date, cell:JTAppleCell?, cellState: CellState){
        handleCellSelected(view:cell, cellState: cellState)
        handleCelltextColor(view:cell, cellState: cellState)
    }
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo){
        setupViewsOfCalendar(from:visibleDates)
    }
    
    
}
extension UIColor{
    convenience init(colorWithHexValue value :Int, alpha:CGFloat = 1.0){
        self.init(
            red:CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green:CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}


