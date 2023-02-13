//
//  ReachabilityManager.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 13.02.2023.
//

import Foundation
import Network

protocol ReachabilityManagerProtocol: AnyObject {
    
    var isInternetConnectionAvailable: Bool { get }
}

class ReachabilityManager: ReachabilityManagerProtocol {
    
    // MARK: - Static Properties
    private static let queueLabel = "CNReachabilityManagerQueue"
    
    // MARK: - Public Properties
    public var isInternetConnectionAvailable = false
    
    // MARK: - Private Properties
    private var connectionMonitor = NWPathMonitor()
    
    // MARK: - Singleton Init
    public static let shared = ReachabilityManager()
    
    private init() {
        #if os(watchOS)
            isInternetConnectionAvailable = true
        
        #else
            let queue = DispatchQueue(
                label: ReachabilityManager.queueLabel
            )
            
            self.connectionMonitor.pathUpdateHandler = { pathUpdateHandler in
                self.isInternetConnectionAvailable = pathUpdateHandler.status == .satisfied
            }
            
            self.connectionMonitor.start(queue: queue)
            
        #endif
    }
}
