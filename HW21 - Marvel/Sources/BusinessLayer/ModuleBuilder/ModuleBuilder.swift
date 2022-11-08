//
//  ModuleBuilder.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 04.11.2022.
//

import UIKit

protocol Builder {
    static func creatCharactersModule() -> UIViewController
    static func creatDetailModule(detail: Character?) -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func creatCharactersModule() -> UIViewController {
        let view = CharactersViewController()
        let networkService = NetworkService()
        let presenter = CharactersPresenter(view: view, networkService: networkService )
        view.presenter = presenter
        return view
    }
    
    static func creatDetailModule(detail: Character?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, detail: detail)
        view.presenter = presenter
        return view
    }
}

