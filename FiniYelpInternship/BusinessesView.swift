//
//  BusinessesView.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import SwiftUI

struct BusinessesView: View {
    var body: some View {
        VStack{
            cardsView
            previousAndNextButtons
        }
    }
}
extension BusinessesView {
    var cardsView : some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0){
                ForEach(0..<3, id: \.self) { _ in
                    BusinessCardView()
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
            Button("Next"){}
        }.buttonStyle(.bordered)
    }
}
#Preview {
    BusinessesView()
}



