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
class LocationManager : NSObject, @preconcurrency CLLocationManagerDelegate {
    var location: CLLocation?
    var error : Error?
    @MainActor var isLocationServicesEnabled: Bool = false
    private var clLocationManager = CLLocationManager()
    override init() {
        super.init()
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        clLocationManager.requestWhenInUseAuthorization()//Modifed info pList to allow this=
        startUpdatingLocation()
    }
   
    func startUpdatingLocation() {
        clLocationManager.startUpdatingLocation()
    }

    @MainActor
    func requestLocationPermission() {
        if !isLocationServicesEnabled {
            clLocationManager.requestWhenInUseAuthorization()
        }
    }
    func requestLocation() {
        clLocationManager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async{
            self.location = location
            self.isLocationServicesEnabled = true
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error) {
        DispatchQueue.main.async{
            print("Failed to find user's location: \(error.localizedDescription)")
            self.error = error
        }
    }
    
    
}

