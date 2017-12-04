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


class CourseScheduleViewController: UIViewController {
    @IBOutlet weak var courseScheduleText: UITextView!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    
    let outsideMonthColor = UIColor(colorWithHexValue: 0x584a66)
    let monthColor = UIColor.white
    let selectedMonthColor = UIColor(colorWithHexValue: 0x3a294b)
    let currentDateSelectedViewColor = UIColor(colorWithHexValue: 0x4e3f5d)
    var sectionClassList = [SectionClass]()
    
    let formatter = DateFormatter()
    var mondayClass = [String]()
    var tuesdayClass = [String]()
    var wednesdayClass = [String]()
    var thursdayClass = [String]()
    var fridayClass = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        courseScheduleText.text = ""
        setupCalendarView()
        
        // This is the test data
        var TestData1 = SectionClass()
        TestData1.courseCatalog = "STAT 340"
        TestData1.courseTitle = "R language"
        TestData1.sectionNumber = "002"
        TestData1.datetime = ["Tuesday 8:30-9:50AM", "Thursday 8:30-9:50AM"]
        TestData1.location = ["STC - Science Teaching Complex 0050", "STC - Science Teaching Complex 0060"]
        TestData1.instructor = [["paul", "rain"],["paul"]]
        var TestData2 = SectionClass()
        TestData2.courseCatalog = "MATH 237"
        TestData2.courseTitle = "Calculus"
        TestData2.sectionNumber = "001"
        TestData2.datetime = ["Monday 8:30-9:50AM", "Wednesday 8:30-9:50AM"]
        TestData2.location = ["DC - Device Center 1350", "DC - Device Center 1351"]
        TestData2.instructor = [["paul", "rain"],["paul"]]
        self.sectionClassList.append(TestData1)
        self.sectionClassList.append(TestData2)
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
            var sectionClassDateTimeList = sectionClass.datetime
            var content = sectionClass.courseCatalog + " - " + sectionClass.sectionNumber + "\n"
            content = content + sectionClass.courseTitle + "\n"
            content = content + "LEC - Lecture" + "\n"
            for index in 0...(sectionClassDateTimeList.count-1){
                var sectionClassDateTime = sectionClassDateTimeList[index]
                var sectionClassDateTimeArray = sectionClassDateTime.components(separatedBy: " ")
                var weekday = sectionClassDateTimeArray[0]
                var time = sectionClassDateTimeArray[1]
                content = content + time + "\n"
                content = content + sectionClass.location[index] + "\n"
                var instructors = sectionClass.instructor[index]
                for instructor in instructors{
                    content = content + instructor + " "
                }
                content = content + "\n"
                if weekday == "Monday"{
                    self.mondayClass.append(content)
                }
                else if weekday == "Tuesday"{
                    self.tuesdayClass.append(content)
                }
                else if weekday == "Wednesday"{
                    self.wednesdayClass.append(content)
                }
                else if weekday == "Thursday"{
                    self.thursdayClass.append(content)
                }
                else if weekday == "Friday"{
                    self.fridayClass.append(content)
                }
                else{
                    print("Invalid date")
                }
            }
        }
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
            var contents = [String]()
            courseScheduleText.text = ""
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
                courseScheduleText.text = courseScheduleText.text + content
            }
        }else{
            validCell.selectedView.isHidden = true
        }
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


