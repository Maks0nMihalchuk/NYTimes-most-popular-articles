//
//  UIStoryboard+Extension.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 10.02.2023.
//

import UIKit

enum Storyboard: String {
    case ArticleDetails
}

protocol StoryboardDesignable : AnyObject {}

extension StoryboardDesignable where Self : UIViewController {
    
    static func instantiate(from storyboard: Storyboard, bundle: Bundle? = nil) -> Self {
        
        let dynamicMetatype = Self.self
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: bundle)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "\(dynamicMetatype)") as? Self else {
            fatalError("Couldn’t instantiate view controller with identifier \(dynamicMetatype)")
        }
        
        return viewController
    }
}

extension UIViewController : StoryboardDesignable {}
