//
//  WatBase.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-09-14.
//  Copyright © 2017 zepengan. All rights reserved.
//

import Foundation

public class BaseClass{
    var apiKey:String = "6c00fb74e00f480d5bbfd80e81493c52"
    var address:String = "https://api.uwaterloo.ca/v2/"
    
    func GetJson(url:URL)
    {
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            if error != nil
            {
                print("Error")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options:JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJson["data"])
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }
}
