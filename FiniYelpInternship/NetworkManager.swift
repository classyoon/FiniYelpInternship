//
//  NetworkManager.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import Foundation
/*
 https://docs.developer.yelp.com/reference/v3_business_search
 Studied the API and found how to set the following :
 
 longitude,
 latitude,
 limit "20"
 offset "0"
 radius "1000"
 term  "restaurants"
 
 Fini Bearer token :  itoMaM6DJBtqD54BHSZQY9WdWR5xI_CnpZdxa3SG5i7N0M37VK1HklDDF4ifYh8SI-P2kI_mRj5KRSF4_FhTUAkEw322L8L8RY6bF1UB8jFx3TOR0-wW6Tk0KftNXXYx
 
 used the built in feature in the documentation to generate getData().
 */
@Observable
class NetworkManager {
    /*
     Used async await instead of closure.
    Modified it so it to take offset and limit as parameters
     */
    func getData(offset: Int, limit: Int) async throws {
        let url = URL(string: "https://api.yelp.com/v3/businesses/search")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "latitude", value: "33.92392983504701"),
            URLQueryItem(name: "longitude", value: "-84.34099727470453"),
            URLQueryItem(name: "term", value: "restaurants"),
            URLQueryItem(name: "radius", value: "1000"),
            URLQueryItem(name: "categories", value: ""),
            URLQueryItem(name: "sort_by", value: "best_match"),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "authorization": "Bearer itoMaM6DJBtqD54BHSZQY9WdWR5xI_CnpZdxa3SG5i7N0M37VK1HklDDF4ifYh8SI-P2kI_mRj5KRSF4_FhTUAkEw322L8L8RY6bF1UB8jFx3TOR0-wW6Tk0KftNXXYx"
        ]
        let (data, _) = try await URLSession.shared.data(for: request)
        print(String(decoding: data, as: UTF8.self))
    }
    
    
}
