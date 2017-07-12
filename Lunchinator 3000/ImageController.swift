//
//  ImageController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//


import UIKit

class ImageController {
    
    static func imageForURL(url: String, completion: @escaping ((_ image: UIImage?) -> Void)) {
        
        guard let url = URL(string: url) else { fatalError("Image URL Optional is nil") }
        NetworkController.performRequestForURL(url: url, httpMethod: .get) { (data, error) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            DispatchQueue.main.async(execute: {
                completion(UIImage(data: data))
            })
        }
    }
}
