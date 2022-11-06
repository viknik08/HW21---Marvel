//
//  CharactersModel.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 04.11.2022.
//

import Foundation

struct CharacterWraper: Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: CharacterContainer
}

struct CharacterContainer: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}

struct Character: Decodable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let resourceURI: String
    let thumbnail: Image
    let comics: Comics
}

struct Image: Decodable {
    let path: String
    let `extension`: String
}

struct Comics: Decodable {
    let available: Int
    let returned: Int
    let collectionURI: String
    let items: [ComicList]
}

struct ComicList: Decodable {
    let resourceURI: String
    let name: String
}

