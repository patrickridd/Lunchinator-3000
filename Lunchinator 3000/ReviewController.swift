//
//  ReviewController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import Foundation

class ReviewController {
    
    static let sharedController = ReviewController()

    let reviewUrlString = "https://interview-project-17987.herokuapp.com/api/restaurants"
    
    func getReviews(for restaurant: String, completion: @escaping (_ reviews: [Review]?)-> Void) {
       
    
        guard let reviewURL = URL(string:"\(self.reviewUrlString)\(restaurant)") else {
            completion(nil)
            return
        }
        
        NetworkController.performRequestForURL(url: reviewURL, httpMethod: .get) { (data, error) in
            guard let data = data, let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [[String:AnyObject]] else {
                print("Couldn't retrieve JSON data")
                completion(nil)
                return
            }
            
            // initialize reviews
            let reviews = jsonDictionary.flatMap({ Review(reviewDict: $0)})
            
            // get back on main queue to update UI
            DispatchQueue.main.async {
                completion(reviews)
            }
        }
    
    }
    
}

    
    
