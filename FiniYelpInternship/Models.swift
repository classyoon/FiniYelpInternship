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
    
    static let example : Business = Business(id: "IDK", name: "HomeUno", imageURL: "https://www.countryandtownhouse.co.uk/wp-content/uploads/2020/08/aqua-shard_NEW_2020-1536x1024.jpg", url: "https://www.visitacity.com/en/london/activities/all-activities?activitiesSearchByName=historic%20pubs%20tour&sbi=Historic%20Pubs&sbn_sec=tour&actid=3858P95&campaginid=418430547&adgroupid=1283130454259605&targetid=kwd-80195873297555:loc-4090&network=o&msclkid=3fe8c0f8504d187f934da757f8a9b7ca&utm_source=bing&utm_medium=cpc&utm_campaign=London%20ActivitiesAC%20G-US-In-EUR&utm_term=historic%20pubs%20london%20tour&utm_content=Historic%20Pubs%20Tour%20-%20AI:3858P95", rating: 3.0)
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image_url"
        case url
        case rating
        
    }
}

