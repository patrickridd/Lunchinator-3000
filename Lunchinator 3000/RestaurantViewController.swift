//
//  RestaurantViewController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {

    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurant = self.restaurant {
            self.update(with: restaurant)
        }
    }

    func update(with restaurant: Restaurant) {
        self.title = restaurant.name
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
