//
//  LocationManager.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import Foundation
import CoreLocation

//Got most of this from studying with ChatGPT
//Added @observable so LocationManagerTestView could use it.

@Observable
class LocationManager : NSObject, CLLocationManagerDelegate{
    var location: CLLocation?
    var error : Error?
    
    private var clLocationManager = CLLocationManager()
    override init() {
        super.init()
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        clLocationManager.requestWhenInUseAuthorization()//Modifed info pList to allow this=
    }
   
    func startUpdatingLocation() {
        clLocationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async{
            self.location = location
        }
    }
    func locationManager(_ manager:CLLocationManager, didFailWithError error : Error) {
        DispatchQueue.main.async{
            print("Failed to find user's location: \(error.localizedDescription)")
            self.error = error
        }
    }
    
    
}

