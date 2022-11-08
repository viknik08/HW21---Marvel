//
//  URLConfiguration.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 06.11.2022.
//

import Foundation

class URLConfiguration {
    public func getURL(publicKey: String, privateKey: String, searchResult: String?) -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = format.string(from: date)

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "gateway.marvel.com"
        urlComponents.path = "/v1/public/characters"
        urlComponents.queryItems = [URLQueryItem(name: "ts", value: timestamp),
                                    URLQueryItem(name: "limit", value: "50"),
                                    URLQueryItem(name: "apikey", value: publicKey),
                                    URLQueryItem(name: "hash", value: (timestamp + privateKey + publicKey).MD5)]
        if let searchText = searchResult {
            urlComponents.queryItems?.append(URLQueryItem(name: "nameStartsWith", value: searchText))
        }
        return urlComponents.url!.absoluteString
    }
}
