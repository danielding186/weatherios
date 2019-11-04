//
//  Weather.swift
//  WeatherIOS
//
//  Created by yanjingding on 11/3/19.
//  Copyright © 2019 yanjingding. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Weather {
    var city: String?
    var state: String?
    var country: String?
    var dateTime: String?
    var description: String?
    var temperature: Double?
    
}

extension Weather {
    init(data dict:JSON) {
        self.city = dict["city_name"].rawString()
        self.state = dict["state_code"].rawString()
        self.country = dict["country_code"].rawString()
        self.dateTime = dict["datetime"].rawString()
        self.description = dict["weather"]["description"].rawString()
        self.temperature = dict["temp"].double
    }
}
