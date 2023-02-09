//
//  BaseViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    var baseTableView = UITableView(frame: .zero, style: .plain)

    // MARK: - Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - setup layout baseTableView
    func setupLayoutBaseTableView() {
        view.addSubview(baseTableView)
        
        baseTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            baseTableView.topAnchor.constraint(equalTo: view.topAnchor),
            baseTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            baseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - show and hide LoadingView
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
