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
    @State var favorite : Bool = false
    
    var body: some View {
        GroupBox{
            HStack{
                Spacer()
                Button(favorite ? "Favorite" : "Mark Favorite") {
                    favorite.toggle()
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(favorite ? Color.yellow : Color.black)
            }
            AsyncImage(url: URL(string: business.imageURL), content: { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipped()
            }, placeholder: {
                ProgressView()
            })
            Text(business.name).font(.largeTitle)
            Text("Business rating : \(business.rating, specifier: "%0.1f")")
                .font(.headline)
        }.padding()
    }
}

#Preview {
    BusinessCardView(business: Business.example)
}
