//
//  CharactersPresenter.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 04.11.2022.
//

import Foundation

protocol CharactersViewProtocol: AnyObject {
    
}

protocol CharactersPresenterProtocol: AnyObject {
    
}

class CharactersPresenter: CharactersPresenterProtocol {
    
    weak var view: CharactersViewProtocol?
    
    
}
