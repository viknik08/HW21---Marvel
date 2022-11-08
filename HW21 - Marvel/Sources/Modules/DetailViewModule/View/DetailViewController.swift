//
//  DetailViewController.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 06.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var presenter: DetailPresenterProtocol?
    
//    MARK: - LifyCircule
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarhy()
        presenter?.requestDetail()
    }
    
//    MARK: - Setup
    
    private func setupHierarhy() {
        detailView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(detailView)
    }
}

// MARK: - Ext protocol

extension DetailViewController: DetailViewProtocol {
    func setDetail(detail: Character?) {
        guard let detail = detail else { return }
        detailView.detail = detail
    }
}
