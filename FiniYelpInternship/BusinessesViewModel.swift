//
//  BusinessesViewModel.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import Foundation

@Observable
class BusinessesViewModel {
    var businesses: [Business] = []
    var currentBusiness: Business?
    var offset: Int = 0
    var limit: Int = 3//TODO: Testing value, remember to changed back.
    var errorMessage : String?
    
    private let networkManager = NetworkManager()
    
    func nextBusiness(){
        
    }
    func previousBusiness(){
        
    }
    func getBusinesses() async{
        do {
            let moreBusinesses = try await networkManager.getData(offset: offset, limit: limit)
            offset += limit
            businesses += moreBusinesses
        }
        catch{
            print("Error : Could not get data with networkManager using of offset \(offset) and limit \(limit)")
        }
    }
    
}
