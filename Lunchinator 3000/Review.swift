//
//  Review.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import Foundation


class Review {
    
    let userImageBaseURL = "https://interview-project-17987.herokuapp.com/images/"
    
    // Dictionary Keys
    let restaurantKey = "restaurant"
    let reviewerKey = "reviewer"
    let ratingKey = "rating"
    let reviewKey = "review"
    let reviewerImageKey = "reviewerImage"
    
    // properties
    let restaurant: String
    let reviewerName: String
    let rating: Rating?
    let review: String
    let reviewerImage: String
    
    
    
    
    init?(reviewDict: [String: AnyObject]) {
        guard let restaurant = reviewDict[restaurantKey] as? String,
            let reviewer = reviewDict[reviewerKey] as? String,
            let rating = reviewDict[ratingKey] as? String,
            let review = reviewDict[reviewKey] as? String,
            let reviewerImage = reviewDict[reviewerImageKey] as? String else {
                return nil
        }
        
        self.restaurant = restaurant
        self.reviewerName = reviewer
        self.rating = Rating(rawValue: rating)
        self.review = review
        self.reviewerImage = "\(self.userImageBaseURL)\(reviewerImage)"
        
    }
    
}
