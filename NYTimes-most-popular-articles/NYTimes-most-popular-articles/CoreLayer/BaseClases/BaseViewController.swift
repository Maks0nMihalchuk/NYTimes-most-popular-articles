//
//  BaseViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    var baseCollectionView = UICollectionView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupBaseCollectionView() {
        view.addSubview(baseCollectionView)
        
        baseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            baseCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            baseCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            baseCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func showLoadingView() {
        let windowView = UIApplication.shared.keyWindow
        
        if let loadingView = windowView?.viewWithTag(LoadingView.tagValue) as? LoadingView {
            loadingView.isLoading = true
        } else {
            let loadingView = LoadingView(frame: UIScreen.main.bounds)
            windowView?.addSubview(loadingView)
            loadingView.isLoading = true
        }
    }
    
    func hideLoadingView() {
        let windowView = UIApplication.shared.keyWindow
        windowView?.viewWithTag(LoadingView.tagValue)?.removeFromSuperview()
    }
}
