//
//  BusinessesView.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import SwiftUI

struct BusinessesView: View {
    @State var vm = BusinessesViewModel()
    var body: some View {
        VStack{
            Text(vm.businesses.count.description)
            cardsView
            previousAndNextButtons
        }.task{
            await vm.getBusinesses()
        }
    }
}
extension BusinessesView {
    var cardsView : some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0){
                ForEach(vm.businesses) { business in
                    BusinessCardView(business: business)
                        .containerRelativeFrame(.horizontal, alignment: .center)
                        .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive) { effect, phase in
                            effect
                                .scaleEffect(1 - abs(phase.value * 0.4))
                            
                        }
                }
            }
        }
        .scrollTargetBehavior(.paging)
    }
    var previousAndNextButtons : some View {
        HStack {
            Button("Prev"){}
            Button("Get"){
                Task{
                    await vm.getBusinesses()
                }
            }
            Button("Next"){}
        }.buttonStyle(.bordered)
    }
}
#Preview {
    BusinessesView()
}



