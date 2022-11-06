//
//  DetailPresenter.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 06.11.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setDetail(detail: Character?)
}

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, detail: Character?)
    func requestDetail()
}

class DetailPresenter: DetailPresenterProtocol {

    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol
    var detail: Character?

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, detail: Character?) {
        self.view = view
        self.networkService = networkService
        self.detail = detail
    }
    
    func requestDetail() {
        self.view?.setDetail(detail: detail)
    }
  
}
