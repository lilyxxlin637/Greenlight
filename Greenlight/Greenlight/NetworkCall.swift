//
//  NetworkCall.swift
//  Greenlight
//
//  Created by Lily Lin on 3/7/21.
//

import Foundation
import Alamofire



struct Recommendations: Equatable, Decodable{
    var name: String
    var doRec: Bool
    var reason: String
    var temp: String = "20.9"
    var humidity: String = "82.00"
    var ph: String = "6.50"
    var nitrogen: String = "90"
    var phosphorous: String = "42"
    var potassium: String = "43"
    
    init(_ productName: String, rec: Bool){
        name = productName
        doRec = rec
        reason = "Best Crop"
    }
    
    static func ==(lhs: Recommendations, rhs: Recommendations) -> Bool {
        return lhs.name == rhs.name
    }
}


func postAlarmo(){
    let parameters: [String: Any] = [
        "latitude": GlobalLatitude,
        "longitude": GlobalLongtitude,
//            "temperature": GlobalTemp,
//            "humidity": GlobalHum,
//            "ph": GlobalPH,
//            "nitrogen": GlobalN,
//            "phosphorous": GlobalP,
//            "potassium": GlobalK,
    ]
    
    let url = "https://cornell-greenlight-backend.azurewebsites.net/api/recommend-crop"
    
    AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate()
        .responseJSON { response in
            switch response.result {
            case .success:
                debugPrint(response)
                break
            case .failure(let error):
                debugPrint(error)
            }
        }
    
}
