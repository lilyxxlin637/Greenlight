//
//  NetworkCall.swift
//  Greenlight
//
//  Created by Lily Lin on 3/7/21.
//

import Foundation
import Alamofire
import SwiftyJSON



struct Recommendations: Equatable{
    var name: String
    var doRec: Bool
    var reason: String
    var temp: String = "20.9"
    var humidity: String = "82.00"
    var ph: String = "6.50"
    var nitrogen: String = "90"
    var phosphorous: String = "42"
    var potassium: String = "43"
    var yield: String = ""
    var profit: String = ""
    
    init(_ productName: String, rec: Bool){
        name = productName
        doRec = rec
        reason = "Best Crop"
    }
    
    static func ==(lhs: Recommendations, rhs: Recommendations) -> Bool {
        return lhs.name == rhs.name
    }
}
    

