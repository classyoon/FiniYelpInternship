//
//  BusinessesViewModel.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import Foundation

@MainActor
@Observable
class BusinessesViewModel {
    @MainActor var businesses: [Business] = []
    @MainActor var currentBusiness: Business?
    @MainActor var offset: Int = 0
    @MainActor var limit: Int = 10//TODO: Testing value, remember to changed back.
    @MainActor var errorMessage : String?
    @MainActor var isFetching = false
    
    private let networkManager: NetworkManager
    
    init(locationManager: LocationManager) {
        networkManager = NetworkManager(locationManager: locationManager)
        
        Task { @MainActor in
            await getBusinesses()
        }
    }
    
    func nextBusiness() {
        guard let currentBusiness,
                let index = businesses.firstIndex(of: currentBusiness),
              index < businesses.count - 1
        else {
            print("Next guard statement failed")
            return }
        
        if index >= businesses.count - 5 {
            Task{
                await getBusinesses()
                self.currentBusiness = businesses[index+1]
            }
        }
        
            self.currentBusiness = businesses[index+1]
        
    }
    func previousBusiness(){
        guard let currentBusiness,
                let index = businesses.firstIndex(of: currentBusiness),
              index > 0
        else { return }
        self.currentBusiness = businesses[index-1]
        
    }
    @MainActor
    func getBusinesses() async{
        guard !isFetching else { return }
        isFetching = true
        do {
            let moreBusinesses = try await networkManager.getData(offset: offset, limit: limit)
            offset += limit
            for business in moreBusinesses {
                if !businesses.contains(business) {
                    businesses.append(business)
                }
                else {
                    print("Duplicates found")
                }
            }
            isFetching = false
        }
        catch{
            isFetching = false
            print("Error : Could not get data with networkManager using of offset \(offset) and limit \(limit)")
        }
    }
    func getMoreBusinessesIfNeeded() async {
        guard let currentBusiness,
              let currentIndex = businesses.firstIndex(of: currentBusiness)
        else {
            print("Get more business")
            return
        }

        if currentIndex >= businesses.count - 3
        {
            print("Starting refresh task at \(currentIndex)")
            Task { @MainActor in
                await getBusinesses()
            }
            
        }
    }
    
}
