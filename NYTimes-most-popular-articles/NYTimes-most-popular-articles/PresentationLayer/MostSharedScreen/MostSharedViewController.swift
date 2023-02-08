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
        setupBaseCollectionView()
    }
}

// MARK: - MostSharedViewProtocol
extension MostSharedViewController: MostSharedViewProtocol {
    
}
