//
//  Review.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import Foundation


class Review {
    
    let restaurantKey = "restaurant"
    let reviewerKey = "reviewer"
    let ratingKey = "rating"
    let reviewKey = "review"
    
    let restaurant: String
    let reviewer: String
    let rating: Rating?
    let review: String
    
    
    init?(reviewDict: [String: AnyObject]) {
        guard let restaurant = reviewDict[restaurantKey] as? String,
            let reviewer = reviewDict[reviewerKey] as? String,
            let rating = reviewDict[ratingKey] as? String,
            let review = reviewDict[reviewKey] as? String else {
                return nil
        }
        
        self.restaurant = restaurant
        self.reviewer = reviewer
        self.rating = Rating(rawValue: rating)
        self.review = review
        
    }
    
}
