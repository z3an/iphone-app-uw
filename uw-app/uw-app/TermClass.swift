//
//  TermsClass.swift
//  uw-app
//
//  Created by 安泽鹏 on 2017-11-15.
//  Copyright © 2017 zepengan. All rights reserved.
//

import Foundation


    
public struct term{
    public let termID: String   /// term id
    public let termName: String /// term name
    init() {
        termID = ""
        termName = ""
    }
}
public struct year {
    public var terms =  [term]() // each year has 3 terms
    init(){
        var winterTerm = term()
        var springTerm = term()
        var fallTerm = term()
        self.terms.append(winterTerm)
        self.terms.append(springTerm)
        self.terms.append(fallTerm)
    }
}

public struct TermClass {
    
    //public var listings = [year]() ///store listings
    //public var previousTerm: Int ///store previous term
    //public var currentTerm: String ///store current term
    //public var nextTerm: String ///store next term
    
    //var previousTerm: Int {
    //    get {
    //
    //    }
    //}
    
    init() {
        //var previousYear = year()
        //var currentYear = year()
        //var nextYear = year()
        //self.previousTerm = ""
        //self.currentTerm = ""
        //self.nextTerm = ""
        //self.listings.append(previousYear)
        //self.listings.append(currentYear)
        //self.listings.append(nextYear)
    }
    
//    public func changeListings(){
//        WatSwift.Terms.listAll { response in
//            // metadata returned by the API, wrapped in a Metadata struct
//            let metadata = response.metadata
//            // Data returned by the API in JSON format.
//            let data: JSON = response.data
//            // ...
//            if self.previousTerm = response.data["previous_term"].string{
//                //previousTerm = previous_Term
//            }
//            if self.currentTerm = response.data["current_term"].string{
//                //self.currentTerm = current_term
//            }
//            if self.nextTerm = response.data["next_term"].string{
//                //self.nextTerm = next_term
//            }
//        }
//    }
//    public static func getPreviousTerm(handler: @escaping ResponseHandler)  -> String{
//        return self.previousTerm
//    }
    
}
