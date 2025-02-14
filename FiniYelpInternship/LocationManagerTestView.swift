//
//  LocationManagerTestView.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import SwiftUI
/*
 This is for testing.
 */
struct LocationManagerTestView: View {
    @State var locationManager = LocationManager()
    var body: some View {
        VStack{
            if let location = locationManager.location {
                Text("Found you at \(location.coordinate.latitude), \(location.coordinate.longitude)")
            }
        }
    }
}

#Preview {
    LocationManagerTestView()
}
