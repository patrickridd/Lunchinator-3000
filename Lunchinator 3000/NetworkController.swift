//
//  NetworkController.swift
//  Lunchinator 3000
//
//  Created by Patrick Ridd on 7/11/17.
//  Copyright © 2017 PatrickRidd. All rights reserved.
//

import Foundation
class NetworkController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    static func performRequestForURL(url: URL, httpMethod: HTTPMethod, urlParameters: [String: String]? = nil, body: Data? = nil, completion: ((_ data: Data?, _ error: Error?) ->Void)?) {
        
        let requestUrl = urlFromParameters(url: url, urlParameters: urlParameters)
        var request = URLRequest(url: requestUrl)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let completion = completion {
                completion(data, error)
            }
        }
        dataTask.resume()
        
    }
    
    
    static func urlFromParameters(url: URL, urlParameters: [String: String]?) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = urlParameters?.flatMap({URLQueryItem(name: $0.0, value: $0.1)})
        
        if let url = components?.url {
            return url
        } else {
            fatalError("URL optional is nil")
        }
    }
}
