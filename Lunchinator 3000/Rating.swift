//
//  Rating.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/12/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import UIKit

enum Rating: String {
    case oneStar = "1"
    case twoStars = "2"
    case threeStars = "3"
    case fourStars = "4"
    case fiveStars = "5"
    
    
    var starImage: UIImage {
        switch self {
        case .oneStar:
            return #imageLiteral(resourceName: "oneStar")
        case .twoStars:
            return #imageLiteral(resourceName: "twoStars")
        case .threeStars:
            return #imageLiteral(resourceName: "threeStars")
        case .fourStars:
            return #imageLiteral(resourceName: "fourStars")
        case .fiveStars:
            return #imageLiteral(resourceName: "fiveStars")
        }
    }
}
