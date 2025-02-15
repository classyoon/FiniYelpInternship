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
            cardsView
            previousAndNextButtons
                
        }.task{
            await vm.getBusinesses()
//            do {
//                try await Task.sleep(for: .seconds(0.5))
//                await vm.getBusinesses()
//            } catch {
//                print("\(error)")
//            }
        }
        
    }
}
extension BusinessesView {
    var cardsView : some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0){
                ForEach(vm.businesses) { business in
                    BusinessCardView(business: business)
                        .id(business)
                        .containerRelativeFrame(.horizontal, alignment: .center)
                        .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive) { effect, phase in
                            effect
                                .scaleEffect(1 - abs(phase.value * 0.4))
                            
                        }
                        .onAppear {
                            vm.currentBusiness = business
                            
                        }
                        .task{
                            
                                await vm.getMoreBusinessesIfNeeded()
                            
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $vm.currentBusiness)
        .scrollIndicators(.hidden)
    }
    var previousAndNextButtons : some View {
        HStack {
            Button("Prev"){
                withAnimation {
                    vm.previousBusiness()
                }
            }
            Button("Next"){
                withAnimation {
                    vm.nextBusiness()
                    print("Next \(vm.currentBusiness?.name ?? "Unknown"), offset \(vm.offset), limit \(vm.limit)")
                }
            }
        }.buttonStyle(.bordered)
    }
}
#Preview {
    BusinessesView()
}



