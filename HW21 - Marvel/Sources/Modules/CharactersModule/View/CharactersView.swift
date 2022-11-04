//
//  CharactersView.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 04.11.2022.
//

import UIKit
import SnapKit

class CharactersView: UIView {

//    MARK: - Outlet
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
//    MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHierarhy()
        setupLayout()
        registerCell()
    }
    
//    MARK: - Setups
    
    private func setupHierarhy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
    }
    
    private func registerCell() {
        tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
    }
}
