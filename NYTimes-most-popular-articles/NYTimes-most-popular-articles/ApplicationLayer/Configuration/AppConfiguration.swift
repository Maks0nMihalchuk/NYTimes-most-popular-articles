//
//  AppConfiguration.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

class AppConfiguration {
    
    static let shared = AppConfiguration()
    
    let apiURL: String
    let apiKey: String
    
    private init() {
        self.apiURL = "https://api.nytimes.com/svc/mostpopular/v2/"
        self.apiKey = "CMmyMZZPht1TSkAnppW3Vn4fTJJrs96x"
    }
}
