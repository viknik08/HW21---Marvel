//
//  CharactersPresenter.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 04.11.2022.
//

import Foundation
import UIKit

protocol CharactersViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
    func updateViewData(_ data: ViewData)
}

protocol CharactersPresenterProtocol: AnyObject {
    init(view: CharactersViewProtocol, networkService: NetworkServiceProtocol)
    func getCharacters()
    var characters: [Character] { get set }
}

class CharactersPresenter: CharactersPresenterProtocol {

    weak var view: CharactersViewProtocol?
    let networkService: NetworkServiceProtocol
    var characters: [Character] = []
    
    required init(view: CharactersViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getCharacters()
    }
    
    func getCharacters() {
        view?.updateViewData(.loading)
            networkService.getCharacters { [weak self] result in
                guard let self = self else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let loadedData):
                        self.characters = loadedData.data.results
                        self.view?.updateViewData(.success)
                        self.view?.success()
                    case .failure(let error):
                        self.view?.failure(error: error)
                        self.view?.updateViewData(.failure)
                }
            }
        }
    }
}
