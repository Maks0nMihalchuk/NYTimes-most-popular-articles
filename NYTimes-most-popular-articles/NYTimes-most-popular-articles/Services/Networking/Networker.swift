//
//  Networker.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation
import Alamofire

enum StatusCodes {
    static let unknownError = 0
    static let ok = 200
    static let created = 201
    static let unuthorized = 401
    static let server = 500
}

class Networker {
    
    private var sessionManager: Session
    
    // MARK: - Public method
    
    func call<T>(type: EndPointType, handle: @escaping (Result<T, NetworkError>) -> Void) where T: Decodable {
        guard let urlRequest = type.urlRequest else {
            handle(.failure(.canNotBuildRequest))
            return
        }
        
        let request = self.sessionManager.request(urlRequest)
        request
            .validate(statusCode: StatusCodes.ok...StatusCodes.created)
            .responseDecodable(of: T.self) { data in
                switch data.result {
                case .success(_):
                    if let jsonData = data.data {
                        guard let result = Networker.parseObject(T.self, data: jsonData) else {
                            handle(.failure(.decodingError))
                            return
                        }
                        handle(.success(result))
                    }
                case .failure(let error):
                    guard let responseCode = error.responseCode else {
                        handle(.failure(.unspecifiedError))
                        return
                    }
                    
                    handle(.failure(Networker.errorHandle(with: responseCode)))
                }
            }
    }
    
    // MARK: - Static methods
    
    static func parseObject<T>(_ type: T.Type, data: Data)  -> T? where T: Decodable {
                
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        
        return nil
    }
    
    static func errorHandle(with responceCode: Int) -> NetworkError {
        switch responceCode {
        case 400...499: return .clientError
        case 500...599: return .unspecifiedError
        default:        return .unspecifiedError
        }
    }
    
    // MARK: - Init
    init(sessionManager: Session = .default) {
        self.sessionManager = sessionManager
    }
    
}
