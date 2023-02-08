//
//  MostSharedViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol MostSharedViewProtocol: AnyObject {
    
}

class MostSharedViewController: BaseViewController {
    
    var presenter: MostSharedPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBaseCollectionView()
    }
}

// MARK: - MostSharedViewProtocol
extension MostSharedViewController: MostSharedViewProtocol {
    
}

// MARK: - setup UI
private extension MostSharedViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
    }
}
