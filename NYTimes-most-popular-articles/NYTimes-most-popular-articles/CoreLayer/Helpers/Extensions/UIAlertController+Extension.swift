//
//  UIAlertController+Extension.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

extension UIAlertController {
    
    static func showAlert(title: String?, message: String?, actions: [UIAlertAction], preferredStyle: UIAlertController.Style = .alert) {
        
        let keyWindow = UIApplication.shared.keyWindow
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        
        actions.forEach { alert.addAction($0) }
        
        DispatchQueue.main.async {
            keyWindow?.rootViewController?.present(alert, animated: true)
        }
    }
    
    static func showErrorAlert(message: String?) {
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        DispatchQueue.main.async {
            UIAlertController.showAlert(title: "Error",
                                        message: message,
                                        actions: [okAction])
        }
    }
}

