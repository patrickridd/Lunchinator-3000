//
//  RestaurantController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import Foundation

class RestaurantController {
    
    static let sharedController = RestaurantController()
    
    let restaurantURLString = "https://interview-project-17987.herokuapp.com/api/restaurants"
    
    func getRestaurants(completion: @escaping ([Restaurant]?) -> Void) {
        
        guard let restaurantURL = URL(string: self.restaurantURLString) else {
            completion(nil)
            return
        }
        NetworkController.performRequestForURL(url: restaurantURL, httpMethod: .get) { (data, error) in
            guard let data = data, let restaurantDictionaries = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [[String:AnyObject]] else {
                print("Cant retrieve restaurants: \(String(describing: error?.localizedDescription))")
                completion(nil)
                return
            }
            
            let restaurants = restaurantDictionaries.flatMap { Restaurant(restaurantDict: $0) }
            completion(restaurants)
        }
    }
    
    
    
}
