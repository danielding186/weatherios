//
//  ViewController.swift
//  WeatherIOS
//
//  Created by yanjingding on 11/3/19.
//  Copyright © 2019 yanjingding. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    var lat: Double?
    var lon: Double?
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.requestWhenInUseAuthorization()
        self.locationManager?.startUpdatingLocation()
    }
    
    func updateWeather() {
        WeatherManager.shared().getCurrentWeather(latitude: self.lat!, longitude: self.lon!) { (weather) in
            print (weather ?? "No data")
            
            self.cityLabel.text = weather?.city
            self.countryLabel.text = weather?.country
            self.descriptionLabel.text = weather?.description
            self.temperatureLabel.text = String(weather?.temperature! as! Double)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (locations.last != nil) {
            self.lat = locations.last?.coordinate.latitude
            self.lon = locations.last?.coordinate.longitude
            print ("\(self.lat)  \(self.lon)")
            self.updateWeather()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print ("\(error)")
    }

}

