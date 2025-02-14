//
//  BusinessCardView.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import SwiftUI

struct BusinessCardView: View {
    let business : Business
    var body: some View {
        GroupBox{
            AsyncImage(url: URL(string: business.imageURL), content: { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300)
                    .clipped()
            }, placeholder: {
                ProgressView()
            })
                
               
            Text(business.name).font(.largeTitle)
            Text("Business rating : 5")
                .font(.headline)
        }.padding()
    }
}

#Preview {
    BusinessCardView(business: Business.example)
}
