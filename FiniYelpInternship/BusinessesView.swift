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
        if vm.businesses.count != 0 {
        VStack{
          
                cardsView
                previousAndNextButtons
                
            }.task{
                await vm.getBusinesses()
            }
        }else{
            VStack{
                ProgressView()
                Text("Tap to Continue")
                Button("Continue"){
                    Task{
                        await vm.getBusinesses()
                    }
                }.task {
                    do {
                        try await Task.sleep(for: .seconds(3))
                        if vm.businesses.isEmpty {
                            await vm.getBusinesses()
                        }
                    } catch {
                        print("Could not force sleep, which makes loading the businesses unlikely.")
                    }
                }
            }
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
                        .onChange(of: vm.currentBusiness, { oldValue, newValue in
                            Task{
                                await vm.getMoreBusinessesIfNeeded()
                            }
                            
                        })
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
            .task{
                do {
                    try await Task.sleep(for: .seconds(3))//This is to try to give some time for location manager to do its thing
                    if vm.businesses.count == 0 {
                        await vm.getBusinesses()
                    }
                }catch{
                    print("Error: failed to sleep")
                }
            }
    }
}
#Preview {
    BusinessesView()
}



