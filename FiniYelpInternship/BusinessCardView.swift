//
//  BusinessCardView.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct BusinessCardView: View {
    let business : Business
    
    let width = UIScreen.main.bounds.width * 0.9
    let height = UIScreen.main.bounds.height * 0.7
    
    var body: some View {
        GroupBox{
            AsyncImage(url: URL(string: business.imageURL), content: { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipped()
            }, placeholder: {
                ProgressView()
            })
//            if let url = URL(string: business.imageURL) {
//                WebImage(url: url) { image in
//                    image
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: width, height: height)
//                        .clipped()
//                } placeholder: {
//                    ProgressView()
//                }
//            }
               
            Text(business.name).font(.largeTitle)
            Text("Business rating : \(business.rating, specifier: "%0.1f")")
                .font(.headline)
        }.padding()
    }
}

#Preview {
    BusinessCardView(business: Business.example)
}
