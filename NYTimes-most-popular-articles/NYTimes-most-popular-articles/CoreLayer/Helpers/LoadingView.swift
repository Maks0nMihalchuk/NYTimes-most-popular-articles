//
//  LoadingView.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

class LoadingView: UIView {
    
    static let tagValue: Int = 1234123
    
    var isLoading: Bool = false {
        didSet {isLoading ? start() : stop()}
    }

    private let indicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    
    func start() {
        indicator.startAnimating()
    }
    
    func stop() {
        indicator.stopAnimating()
    }
    
    // MARK: - Private method
    
    private func initialSetup() {
        tag = LoadingView.tagValue
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
