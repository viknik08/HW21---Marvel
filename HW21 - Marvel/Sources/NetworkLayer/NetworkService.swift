//
//  NetworkService.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 05.11.2022.
//

import Foundation

typealias CharactersResult = Result<CharacterWraper, Error>

protocol NetworkServiceProtocol {
    func getCharacters(searchResult: String?, _ completion: @escaping (CharactersResult) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    let urlConfig = URLConfiguration()

    func getCharacters(searchResult: String?, _ completion: @escaping (CharactersResult) -> Void) {
        guard let url = URL(string: urlConfig.getURL(publicKey: ApiKeys.publicKey, privateKey: ApiKeys.privateKey, searchResult: searchResult)) else { return }
        URLSession.shared.dataTask(with: url) { data, respose, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
                return
            }
            guard let dataRes = data else { return }
            
            do {
                let characters = try JSONDecoder().decode(CharacterWraper.self, from: dataRes)
                completion(.success(characters))
                
            } catch let jesonError {
                completion(.failure(jesonError))
            }
        }.resume()
    }
}
