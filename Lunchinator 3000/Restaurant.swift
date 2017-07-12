//
//  Restaurant.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import Foundation

class Restaurant {
    
    let restaurantImageBaseURL = "https://interview-project-17987.herokuapp.com/images/"
    
    let nameKey = "name"
    let waitTimeKey = "waitTimeMinutes"
    let typesKey = "types"
    let imageKey = "image"
    let descriptionKey = "description"
    
    let name: String
    var waitTime: Int
    var typesOfFood: [String] = []
    var image: String
    var description: String
    
    
    init?(restaurantDict: [String: AnyObject]) {
        guard let name = restaurantDict[nameKey] as? String,
            let waitTime = restaurantDict[waitTimeKey] as? Int,
            let typesOfFood = restaurantDict[typesKey] as? [String],
            let image = restaurantDict[imageKey] as? String,
            let description = restaurantDict[descriptionKey] as? String else {
                return nil
        }
        
        self.name = name
        self.waitTime = waitTime
        self.typesOfFood = typesOfFood
        self.image = "\(self.restaurantImageBaseURL)\(image)"
        self.description = description
    
    }

    
}
