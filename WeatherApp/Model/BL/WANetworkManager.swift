//
//  WANetworkManager.swift
//  WeatherApp
//
//  Created by Saša Brezovac on 06.07.2018..
//  Copyright © 2018. CopyPaste89. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


var baseURL: String = "https://api.darksky.net/forecast/a37b2331d675e600a19a4f676c1a538b/37.8267,-122.4233"

struct WeatherNetworkManager {
    
    static func getWeather(success: @escaping (JSON) -> Void, failure: @escaping(Error) -> Void) {
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        WASyncManager.request(url: baseURL, method: .get, parameters: nil, header: headers, success: { (response) in
            success(response)
            print("response: \(response)")
        }) { (error) in
            failure(error)
            print(error.localizedDescription)
        }
    }
    
}