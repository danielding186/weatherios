//
//  WeatherManager.swift
//  WeatherIOS
//
//  Created by yanjingding on 11/3/19.
//  Copyright © 2019 yanjingding. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WeatherManager: NSObject {
    private static let sharedManager = WeatherManager()
    private static let URL: String = "https://api.weatherbit.io/v2.0"
    private static let API_Key: String = "27d37c5083944c0893be8ff1208c201d"
    
    private override init() {
        super.init()
    }
    
    class func shared() -> WeatherManager {
        return sharedManager
    }
    
    func getCurrentWeather(latitude:Double, longitude:Double, completion: @escaping (Weather?)-> Void) {
        let url:String = WeatherManager.URL + "/current?lat=\(latitude)&lon=\(longitude)&key=\(WeatherManager.API_Key)"
        
        Alamofire.request(url).responseJSON { response in
            if response.result.isSuccess {
                let data:JSON = JSON(response.result.value!)
                let weather:Weather? = Weather(data:data["data"][0])
                completion(weather)
            } else {
                completion(nil)
            }
        }
    }

}
