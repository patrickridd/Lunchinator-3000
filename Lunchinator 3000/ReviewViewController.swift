//
//  ReviewViewController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/12/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    var review: Review?
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let review = review {
            setupPage(with: review)
        }
    }
    
    func setupPage(with review: Review) {
        self.reviewLabel.text = review.review
        self.nameLabel.text = review.reviewerName
        self.ratingImageView.image = review.rating?.starImage
        
        ImageController.sharedController.imageForURL(url: review.reviewerImage) { (image) in
            self.userImageView.image = image
        }
    }

}
