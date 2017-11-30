//
//  AcademicRequirementData.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-11-29.
//  Copyright © 2017 zepengan. All rights reserved.
//

import Foundation
import UIKit

func callBrowser(url:String){
    if (UIApplication.shared.canOpenURL(NSURL(string:url)! as URL)) {
        UIApplication.shared.openURL(NSURL(string:url)! as URL)
    }
}

let ActuarialScienceProgramJSON:[String:String] = [
    "Actuarial science":"http://ugradcalendar.uwaterloo.ca/page/MATH-Actuarial-Science",
    "Actuarial science/finance option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Actuarial-Science-or-Finance-Option",
    "Actuarial science overview":"http://ugradcalendar.uwaterloo.ca/page/MATH-Actuarial-Science-Overview-1",
    "Actuarial science/Predictive Analytics Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Actuarial-Science-Prediction-Analytics-Option",
    "Joint Actuarial Sience":"http://ugradcalendar.uwaterloo.ca/page/MATH-Joint-Actuarial-Science",
    "Mathematical Finance":"http://ugradcalendar.uwaterloo.ca/page/MATH-Actuarial-Science-Mathematical-Finance",
    "Actuarial Science Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Actuarial-Science-Minor"
]
let AppliedMathProgramJSON:[String:String] = [
    "Applied Mathematics Overview":"http://ugradcalendar.uwaterloo.ca/page/MATH-Applied-Mathematics-Overview-1",
    "Applied Mathematics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Applied-Mathematics",
    "Joint Applied Mathematics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Joint-Applied-Mathematics",
    "Applied Mathematics/Biology Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Applied-Mathematics-or-Biology-Option",
    "Applied Mathematics/Earth Science Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Applied-Mathematics-or-Earth-Science-Option",
    "Applied Mathematics/Economics Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Applied-Mathematics-or-Economics-Option",
    "Applied Mathematics/Physics Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Applied-Mathematics-or-Physics-Option",
    "Applied Mathematics with Engineering Electives":"http://ugradcalendar.uwaterloo.ca/page/MATH-Applied-Mathematics-Eng-Electives",
    "Mathematical Physics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Mathematical-Physics",
    "Scientific Computation/Applied Mathematics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Scientific-Computation-or-Applied-Mathematics",
    "Applied Mathematics Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Applied-Mathematics-Minor"
]
let CombinatoricsandOptimizationincludingMathematicalOptimizationJSON:[String:String] = [
    "Combinatorics and Optimization Overview":"http://ugradcalendar.uwaterloo.ca/page/MATH-Combinatorics-and-Optimization-Overview-1",
    "Combinatorics and Optimization":"http://ugradcalendar.uwaterloo.ca/page/MATH-Combinatorics-and-Optimization",
    "Combinatorics and Optimization Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Combinatorics-and-Optimization-Minor",
    "Mathematical Optimization":"http://ugradcalendar.uwaterloo.ca/page/MATH-Mathematical-Optimization"
]
let ComputationalMathematicsJSON:[String:String] = [
    "Computational Mathematics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computational-Mathematics",
    "Computational Mathematics Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computational-Mathematics-Minor"
]
let ComputerScienceJSON:[String:String] = [
    "Computer Science Major Plans":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computer-Science-Major-Plans-1",
    "Bachelor of Computer Science":"http://ugradcalendar.uwaterloo.ca/page/MATH-Bachelor-of-Computer-Science-1",
    "Bachelor of Mathematics (Computer Science)":"http://ugradcalendar.uwaterloo.ca/page/MATH-Bachelor-of-Mathematics-Computer-Science",
    "Business Administration and Computer Science Double Degree":"http://ugradcalendar.uwaterloo.ca/page/MATH-Business-Admin-Computer-Science-Double-Degree",
    "Business Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computer-Science-Business-Option",
    "Digital Hardware Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computer-Science-Digital-Hardware-Option",
    "Software Engineering Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computer-Science-Software-Engineering-Option",
    "Joint Computer Science (Bachelor of Mathematics)":"http://ugradcalendar.uwaterloo.ca/page/MATH-Joint-Computer-Science-Bachelor-of-Math",
    "Joint Bachelor of Computer Science":"http://ugradcalendar.uwaterloo.ca/page/MATH-Joint-Bachelor-of-Computer-Science",
    "Bioinformatics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computer-Science-Bioinformatics",
    "Computer Science Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computer-Science-Minor-1",
    "Accelerated Master's Academic Plans in Computer Science":"http://ugradcalendar.uwaterloo.ca/page/MATH-Accelerated-Masters-Acad-Plans-Computer-Sci"
]
let ComputingandFinancialManagementJSON:[String:String] = [
    "Computing and Financial Management Overview and Degree Requirements":"http://ugradcalendar.uwaterloo.ca/page/MATH-Computing-Financial-Mngt-Overview-Degree-Req"
]
let HealthInformaticsOptionJSON:[String:String] = [
    "":"http://ugradcalendar.uwaterloo.ca/page/MATH-Health-Informatics-Option"
]
let MathematicsBusinessJSON:[String:String] = [
    "Business Administration and Mathematics Double Degree":"http://ugradcalendar.uwaterloo.ca/page/MATH-Bus-Admin-and-Math-Double-Degree-Requirements",
    "Information Technology Management":"http://ugradcalendar.uwaterloo.ca/page/MATH-Information-Techn-Mgt-Degree-Requirements",
    "Mathematical Economics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Mathematical-Economics-Degree-Requirements",
    "Mathematics/Business Administration":"http://ugradcalendar.uwaterloo.ca/page/MATH-Mathematics-or-Bus-Admin-Degree-Requirements",
    "Mathematics/Chartered Professional Accountancy (co-op only)":"http://ugradcalendar.uwaterloo.ca/page/MATH-Math-or-Chart-Prof-Accounting-co-Requirements",
    "Finance Option (co-op only)":"http://ugradcalendar.uwaterloo.ca/page/MATH-Math-Chart-Prof-Accounting-Finance-OptionCoop",
    "Mathematics/Financial Analysis and Risk Management":"http://ugradcalendar.uwaterloo.ca/page/MATH-Math-or-Fin-Analysis-Risk-Mgt-Degree-Reqmnt"
]
let MathematicalStudiesJSON:[String:String] = [
    "Mathematical Studies":"http://ugradcalendar.uwaterloo.ca/page/MATH-Mathematical-Studies",
    "Mathematical Studies - Business Specialization":"http://ugradcalendar.uwaterloo.ca/page/MATH-Math-Studies-Business-Specialization"
]
let MathematicsTeachingJSON:[String:String] = [
    "Mathematics/Teaching (co-op only)":"http://ugradcalendar.uwaterloo.ca/page/MATH-Mathematics-or-Teaching-Co-op-only"
]
let PlansforStudentsoutsidetheMathematicsFacultyJSON:[String:String] = [
    "Joint Bachelor of Computer Science":"http://ugradcalendar.uwaterloo.ca/page/MATH-Joint-Bachelor-of-Computer-Science-2",
    "Joint Honours Academic Plans with Mathematics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Joint-Honours-Academic-Plans-with-Math-1",
    "Combinatorics and Optimization Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Combinatorics-and-Optimization-Minor1",
    "Computing Technology Option":"http://ugradcalendar.uwaterloo.ca/page/MATH-Plans-Outside-Math-Computing-Technology-Opt",
    "Mathematics Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Mathematics-Minor-1",
    "Pure Mathematics Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Plans-Outside-Math-Pure-Mathematics-Minor"
]
let PureMathematicsJSON:[String:String] = [
    "Pure Mathematics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Pure-Mathematics",
    "Joint Pure Mathematics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Joint-Pure-Mathematics",
    "Pure Mathematics/Teaching (co-op only)":"http://ugradcalendar.uwaterloo.ca/page/MATH-Pure-Mathematics-or-Teaching-co-op-only",
    "Mathematical Finance":"http://ugradcalendar.uwaterloo.ca/page/MATH-Pure-Mathematics-Mathematical-Finance",
    "Pure Mathematics Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Pure-Mathematics-Minor-1"
]
let SoftwareEngineeringJSON:[String:String] = [
    "":"http://ugradcalendar.uwaterloo.ca/page/MATH-Software-Engineering"
]
let StatisticsJSON:[String:String] = [
    "Statistics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Statistics",
    "Joint Statistics":"http://ugradcalendar.uwaterloo.ca/page/MATH-Joint-Statistics",
    "Data Science":"http://ugradcalendar.uwaterloo.ca/page/MATH-Data-Science",
    "Statistics for Health":"http://ugradcalendar.uwaterloo.ca/page/MATH-Statistics-for-Health",
    "Statistics Minor":"http://ugradcalendar.uwaterloo.ca/page/MATH-Statistics-Minor"
]
let facultyJSON:[String:[String:String]] = [
    "Actuarial Science":ActuarialScienceProgramJSON,
    "Applied Math":AppliedMathProgramJSON,
    "Combinatorics and Optimization including Mathematical Optimization":CombinatoricsandOptimizationincludingMathematicalOptimizationJSON,
    "Computational Mathematics":ComputationalMathematicsJSON,
    "Computer Science":ComputerScienceJSON,
    "Computing and Financial Management":ComputingandFinancialManagementJSON,
    "Health Informatics Option":HealthInformaticsOptionJSON,
    "Mathematics/Business":MathematicsBusinessJSON,
    "Mathematical Studies":MathematicalStudiesJSON,
    "Mathematics/Teaching":MathematicsTeachingJSON,
    "Plans for Students outside the Mathematics Faculty":PlansforStudentsoutsidetheMathematicsFacultyJSON,
    "Pure Mathematics":PureMathematicsJSON,
    "Software Engineering":SoftwareEngineeringJSON,
    "Statistics":StatisticsJSON
]
