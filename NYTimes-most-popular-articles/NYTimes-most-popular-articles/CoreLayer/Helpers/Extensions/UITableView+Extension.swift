//
//  UITableView+Extension.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

extension UITableView {
    
    func regiserCellByClass<T: UITableViewCell>(cellClass: T.Type) {
        let className = String(describing: cellClass)
        let bundle = Bundle(identifier: "com.makson-project.NYTimes-most-popular-articles")
        register(UINib(nibName: className, bundle: bundle), forCellReuseIdentifier: className)
    }
    
    func dequeueCellBy<T: UITableViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath) as? T else {
            fatalError("dequeueCellBy method has not worked correctly")
        }
        return cell
    }
}
