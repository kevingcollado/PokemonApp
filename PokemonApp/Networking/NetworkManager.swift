//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 10/12/23.
//

import Foundation
import Alamofire

public class NetworkManager{
    
    static func fetchItems(handler: @escaping(Pokemon) -> ()) {
        AF.request(NetworkConstant.shared.apiAddress, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            response in
            switch response.result {
            case .success(let data):
                do {
                    var jsonData = try JSONDecoder().decode(Pokemon.self, from: data!)
                    jsonData.remove(at: 0)
                    handler(jsonData)
                }catch{
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

enum NetworkError: Error{
    case urlError
    case canNotPaseData
}
