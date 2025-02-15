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
            
            
            VStack{
                AsyncImage(url: URL(string: business.imageURL), content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .clipped()
                }, placeholder: {
                    ProgressView()
                })
                .overlay{
                    favoriteButton
                }
                Text(business.name).font(.largeTitle)
                Text("Business rating : \(business.rating, specifier: "%0.1f")")
                    .font(.headline)
                
                
                
            }
        }.padding()
    }
    var favoriteButton : some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    favorite.toggle()
                } label: {
                    Image(systemName: favorite ? "star.fill" : "star")
                        .foregroundStyle(Color.yellow)
                        .font(.largeTitle)
                }
                .padding(8)
                .background{
                    Color(UIColor.systemBackground).opacity(0.2)
                        .clipShape(Circle())
                }
                .padding(8)
            }
            Spacer()
        }
    }
}

#Preview {
    BusinessCardView(business: Business.example)
}

