//
//  RestaurantDetailViewController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/12/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var waitTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let restaurant = restaurant {
            update(with: restaurant)
        }
    }

    func update(with restaurant: Restaurant) {
        self.nameLabel.text = restaurant.name
        self.waitTimeLabel.text = "Wait Time: \(restaurant.waitTime) minutes"
        self.descriptionLabel.text = restaurant.description
        // Stars image
        
       ImageController.imageForURL(url: restaurant.image, completion: { (image) in
            if let image = image {
                self.foodImageView.image = image
            }
        })
    }

}
