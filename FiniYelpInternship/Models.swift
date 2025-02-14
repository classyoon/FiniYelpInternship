//
//  Models.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import Foundation

/*
 These models are from the yelp API. I used https://app.quicktype.io to generate the models and reduced the excess variables.
 Per instructions these were the urls given to me :
 https://www.yelp.com/developers/documentation/v3/business_search
 https://api.yelp.com/v3/businesses/search
 */
struct YelpResult: Codable {
    let businesses: [Business]
    let total: Int
}
struct Business: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let imageURL: String
    let url: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image_url"
        case url
        case rating
        
    }
}

