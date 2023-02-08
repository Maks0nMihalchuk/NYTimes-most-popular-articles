//
//  UICollectionView+extension.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

extension UICollectionView {
    
    public func regiserCellByClass<T: UICollectionViewCell>(cellClass: T.Type) {
        let className = String(describing: cellClass)
        let bundle = Bundle(identifier: "com.makson-project.NYTimes-most-popular-articles")
        register(UINib(nibName: className, bundle: bundle), forCellWithReuseIdentifier: className)
    }
    
    public func dequeueCellBy<T: UICollectionViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath) as? T else {
            fatalError("dequeueCellBy method has not worked correctly")
        }
        return cell
    }
}
