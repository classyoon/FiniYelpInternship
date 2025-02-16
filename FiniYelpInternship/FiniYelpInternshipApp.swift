//
//  FiniYelpInternshipApp.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import SwiftUI

@main
struct FiniYelpInternshipApp: App {
    let locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            if locationManager.location == nil {
                VStack {
                    ProgressView()
                    Text("Waiting to get location...")
                    Text("App can not work without location")
                    Text("Please delete app and reinstall if you denied locatoin permission.")
                }
            } else {
                BusinessesView(locationManager: locationManager)
            }
        }
    }
}
