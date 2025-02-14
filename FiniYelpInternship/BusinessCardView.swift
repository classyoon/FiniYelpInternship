//
//  BusinessCardView.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import SwiftUI

struct BusinessCardView: View {
    var body: some View {
        GroupBox{
            Image(.restuarant)
                .resizable()
                .scaledToFill()
                .frame(width: 300)
                .clipped()
               
            Text("Skyscraper Resturant").font(.largeTitle)
            Text("Business rating : 5")
                .font(.headline)
        }.padding()
    }
}

#Preview {
    BusinessCardView()
}
