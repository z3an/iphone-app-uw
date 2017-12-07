//
//  Utilities.swift
//  uw-app
//
//  Created by Guyu Li on 2017-12-04.
//  Copyright © 2017 zepengan. All rights reserved.
//

import Foundation

class Utilities {
    
    static func convertTo24Hour(oriDateTime: String) -> String {
        var datetime = oriDateTime
        let startTimeEndIndex = oriDateTime.index(oriDateTime.startIndex, offsetBy: 2)
        let oldStartTime: String = String(oriDateTime[..<startTimeEndIndex]) // 03
        
        var newStartTime = oldStartTime
        if oldStartTime < "08" {
            newStartTime = String(Int(oldStartTime)!+12)
            datetime = datetime.replacingOccurrences(of: oldStartTime, with: newStartTime)
        }

        let endTimeBeginIndex = oriDateTime.index(oriDateTime.startIndex, offsetBy: 6)
        let endTimeEndIndex = oriDateTime.index(oriDateTime.startIndex, offsetBy: 8)
        let oldEndTime: String = String(oriDateTime[endTimeBeginIndex..<endTimeEndIndex]) // 04
        
        var newEndTime = oldEndTime
        if oldEndTime < "08" {
            newEndTime = String(Int(oldEndTime)!+12)
            datetime = datetime.replacingOccurrences(of: oldEndTime, with: newEndTime)
        }
        
        return datetime
    }
    static func sectionTimeConflict(section: SectionClass) -> Bool
    {
        var sectionClassList = ViewController.addedSection
        var mondayClass = [sectionClassSimple]()
        var tuesdayClass = [sectionClassSimple]()
        var wednesdayClass = [sectionClassSimple]()
        var thursdayClass = [sectionClassSimple]()
        var fridayClass = [sectionClassSimple]()
        for sectionClass in sectionClassList{
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
                        mondayClass.append(courseSectionSimple)
                    }
                    else if String(weekdates[i]) == "T" && String(weekdates[weekdates.index(after:i)]) == "h"{
                        //var thursdaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        thursdayClass.append(courseSectionSimple)
                    }
                    else if String(weekdates[i]) == "h"{continue}
                    else if String(weekdates[i]) == "T"{
                        //var tuesdaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        tuesdayClass.append(courseSectionSimple)
                    }
                    else if String(weekdates[i]) == "W"{
                        //var wednesdaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        wednesdayClass.append(courseSectionSimple)
                    }
                    else if String(weekdates[i]) == "F"{
                        //var fridaySection = content + classtime + "\n" + classLocation + "\n" + instructor + "\n"
                        fridayClass.append(courseSectionSimple)
                    }
                    else{
                        print("Invalid weekdate")
                    }
                }
            }
        }
        mondayClass.sort{ $0.sectionTime < $1.sectionTime }
        tuesdayClass.sort{ $0.sectionTime < $1.sectionTime }
        wednesdayClass.sort{ $0.sectionTime < $1.sectionTime }
        thursdayClass.sort{ $0.sectionTime < $1.sectionTime }
        fridayClass.sort{ $0.sectionTime < $1.sectionTime }
        //["09:30-11:30MF"]
        var selectedSectionTimeList = section.datetime
        //get "09:30-11:30MF"
        for selectedSectionTime in selectedSectionTimeList{
            //get 11 index
            let start = selectedSectionTime.index(selectedSectionTime.startIndex, offsetBy:11)
            //get "MF"
            let weekdates = selectedSectionTime[start..<selectedSectionTime.endIndex]
            //get 11 index
            let classtimePeriod = selectedSectionTime.index(selectedSectionTime.startIndex, offsetBy: 11)
            //get "09:30-11:30"
            let classtime = selectedSectionTime.prefix(upTo: classtimePeriod)
            //get 5 index
            let clastimeStartSelectedIndex = classtime.index(classtime.startIndex, offsetBy: 5)
            //get "09:30"
            let clastimeStartSelected = classtime.prefix(upTo: clastimeStartSelectedIndex)
            //get 6 index
            let classtimeEndSelectedIndex = classtime.index(classtime.startIndex, offsetBy: 6)
            //get "11:30"
            let classtimeEndSelected = classtime[classtimeEndSelectedIndex..<classtime.endIndex]
            for i in weekdates.indices{
                if String(weekdates[i]) == "M"{
                    for mondayclass in mondayClass{
                        var mondayclassTime = mondayclass.sectionTime
                        let classtimeStart = mondayclassTime.index(mondayclassTime.startIndex, offsetBy: 5)
                        let mondayclassStartTime = mondayclassTime.prefix(upTo: classtimeStart)
                        let classtimeEnd = mondayclassTime.index(mondayclassTime.startIndex, offsetBy: 6)
                        var mondayclassEndTime = mondayclassTime[classtimeEnd..<mondayclassTime.endIndex]
                        if classtimeEndSelected <= mondayclassStartTime{
                            continue
                        }
                        else if clastimeStartSelected >= mondayclassEndTime{
                            continue
                        }
                        else{
                            print("Conflict with " + mondayclass.courseCatalog + " " + mondayclass.sectionTime + " in Monday")
                            return true
                        }
                    }
                }
                else if String(weekdates[i]) == "T" && String(weekdates[weekdates.index(after:i)]) == "h"{
                    for thursdayclass in thursdayClass{
                        var thursdayclassTime = thursdayclass.sectionTime
                        let classtimeStart = thursdayclassTime.index(thursdayclassTime.startIndex, offsetBy: 5)
                        let thursdayclassStartTime = thursdayclassTime.prefix(upTo: classtimeStart)
                        let classtimeEnd = thursdayclassTime.index(thursdayclassTime.startIndex, offsetBy: 6)
                        var thursdayclassEndTime = thursdayclassTime[classtimeEnd..<thursdayclassTime.endIndex]
                        if classtimeEndSelected <= thursdayclassStartTime{
                            continue
                        }
                        else if clastimeStartSelected >= thursdayclassEndTime{
                            continue
                        }
                        else{
                            print("Conflict with " + thursdayclass.courseCatalog + " " + thursdayclass.sectionTime + " in Thursday")
                            return true
                        }
                    }
                }
                else if String(weekdates[i]) == "h"{continue}
                else if String(weekdates[i]) == "T"{
                    for tuesdayclass in tuesdayClass{
                        var tuesdayclassTime = tuesdayclass.sectionTime
                        let classtimeStart = tuesdayclassTime.index(tuesdayclassTime.startIndex, offsetBy: 5)
                        let tuesdayclassStartTime = tuesdayclassTime.prefix(upTo: classtimeStart)
                        let classtimeEnd = tuesdayclassTime.index(tuesdayclassTime.startIndex, offsetBy: 6)
                        var tuesdayclassEndTime = tuesdayclassTime[classtimeEnd..<tuesdayclassTime.endIndex]
                        if classtimeEndSelected <= tuesdayclassStartTime{
                            continue
                        }
                        else if clastimeStartSelected >= tuesdayclassEndTime{
                            continue
                        }
                        else{
                            print("Conflict with " + tuesdayclass.courseCatalog + " " + tuesdayclass.sectionTime + " in Tuesday")
                            return true
                        }
                    }
                }
                else if String(weekdates[i]) == "W"{
                    for wednesdayclass in wednesdayClass{
                        var wednesdayclassTime = wednesdayclass.sectionTime
                        let classtimeStart = wednesdayclassTime.index(wednesdayclassTime.startIndex, offsetBy: 5)
                        let wednesdayclassStartTime = wednesdayclassTime.prefix(upTo: classtimeStart)
                        let classtimeEnd = wednesdayclassTime.index(wednesdayclassTime.startIndex, offsetBy: 6)
                        var wednesdayclassEndTime = wednesdayclassTime[classtimeEnd..<wednesdayclassTime.endIndex]
                        if classtimeEndSelected <= wednesdayclassStartTime{
                            continue
                        }
                        else if clastimeStartSelected >= wednesdayclassEndTime{
                            continue
                        }
                        else{
                            print("Conflict with " + wednesdayclass.courseCatalog + " " + wednesdayclass.sectionTime + " in Wednesday")
                            return true
                        }
                    }
                }
                else if String(weekdates[i]) == "F"{
                    for fridayclass in fridayClass{
                        var fridayclassTime = fridayclass.sectionTime
                        let classtimeStart = fridayclassTime.index(fridayclassTime.startIndex, offsetBy: 5)
                        let fridayclassStartTime = fridayclassTime.prefix(upTo: classtimeStart)
                        let classtimeEnd = fridayclassTime.index(fridayclassTime.startIndex, offsetBy: 6)
                        var fridayclassEndTime = fridayclassTime[classtimeEnd..<fridayclassTime.endIndex]
                        if classtimeEndSelected <= fridayclassStartTime{
                            continue
                        }
                        else if clastimeStartSelected >= fridayclassEndTime{
                            continue
                        }
                        else{
                            print("Conflict with " + fridayclass.courseCatalog + " " + fridayclass.sectionTime + " in Friday")
                            return true
                        }
                    }
                }
                    
                else{
                    print("Invalid weekday")
                }
            }
        }
        return false
    }
    
}
