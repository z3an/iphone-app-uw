//
//  WatSwiftCourse.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-09-14.
//  Copyright © 2017 zepengan. All rights reserved.
//

import Foundation

public class UWCourse: BaseClass{
    public var jsonFile:String = "courses.json"
    
    func GetJsonInCourse()
    {
        let courseURL = URL(string:(super.address + self.jsonFile + "?key=" + super.apiKey))
        super.GetJson(url: courseURL!)
    }
    
    
}
