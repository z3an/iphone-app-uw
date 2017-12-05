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
    
    
}
