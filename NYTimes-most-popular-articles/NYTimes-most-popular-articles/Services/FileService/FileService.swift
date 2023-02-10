//
//  FileService.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 10.02.2023.
//

import Foundation

protocol FileServiceProtocol {
    func writeFile(file: Data, name: String)
    func getFile(by path: String) -> Data?
}

class FileService: FileServiceProtocol {
    
    func writeFile(file: Data, name: String) {
        let path = self.getDocumentDirectoryURL().appendingPathComponent(name)
        try? file.write(to: path)
    }
    
    func getFile(by path: String) -> Data? {
        let documentDirectoryURL = self.getDocumentDirectoryURL()
                
        let fileURL = documentDirectoryURL.appendingPathComponent(path)
        return try? Data(contentsOf: fileURL)
    }
    
    private func getDocumentDirectoryURL() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[.zero]
    }
}
