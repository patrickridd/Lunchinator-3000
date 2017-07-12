//
//  ReviewsPageViewController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/12/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import UIKit

class ReviewsPageViewController: UIPageViewController {

    
    var restaurant: Restaurant?
    var reviews: [Review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let restaurant = self.restaurant else { return }
        
        ReviewController.sharedController.getReviews(for: restaurant.name, completion: { (reviews) in
            if let reviews = reviews {
                self.reviews = reviews
            }
        
        })
    }
    

   

}
