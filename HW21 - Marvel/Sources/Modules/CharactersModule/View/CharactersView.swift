//
//  CharactersView.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 04.11.2022.
//

import UIKit
import SnapKit

class CharactersView: UIView {
    
    var viewData: ViewData? = .initial {
        didSet {
            setNeedsLayout()
        }
    }

//    MARK: - Outlet
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = .black
        return indicator
    }()
    
//    MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHierarhy()
        setupLayout()
        registerCell()
        
        switch viewData {
            
        case .initial:
            startStopActivityIndicator(viewData: nil)
        case .loading:
            startStopActivityIndicator(viewData: .loading)
            update(isHidden: true)
        case .success:
            startStopActivityIndicator(viewData: .success)
            update(isHidden: false)
        case .failure:
            update(isHidden: false)
            startStopActivityIndicator(viewData: .failure)
        default:
            break
        }
    }
    
//    MARK: - Setups
    
    private func setupHierarhy() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
        activityIndicator.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
    }
    
    private func registerCell() {
        tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
    }
    
    private func update(isHidden: Bool) {
        tableView.isHidden = isHidden
    }
    
    private func startStopActivityIndicator(viewData: ViewData?) {
        
        switch viewData {

        case .loading:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        default:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
}
