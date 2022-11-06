//
//  DetailView.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 06.11.2022.
//

import UIKit

class DetailView: UIView {
    
    var detail: Character? {
        didSet {
            if let detail = detail {
                titleLabel.text = detail.name
                descriptionLabel.text = detail.description.isEmpty ? "No info" : detail.description
                guard let imageLink = URL(string: String.getUrlString(image: detail.thumbnail, variant: ImageVarians.standardExtraLarge)) else { return }
                backgroundImage.load(url: imageLink)
            }
        }
    }
    
//    MARK: - Outlets
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16 , weight: .bold)
        return label
    }()
    
    private let backgroundImage: ImageViewWithGradient = {
        let image = ImageViewWithGradient(frame: .zero)
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let activityIndicator: UIActivityIndicatorView = {
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
    }
    
//    MARK: - Setups
    private func setupHierarhy() {
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    private func setupLayout() {
        backgroundImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundImage.snp.centerX)
            make.top.equalTo(backgroundImage.snp.top).offset(60)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundImage.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(backgroundImage).offset(20)
            make.right.equalTo(backgroundImage).offset(-20)

        }
        tableView.snp.makeConstraints { make in
            make.right.left.equalTo(backgroundImage)
            make.bottom.equalTo(backgroundImage.snp.bottom).offset(-20)
            make.height.equalTo(self.bounds.height / 2)

        }
        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(50)
            make.left.right.equalTo(backgroundImage)
        }
    }
    
    private func registerCell() {
        tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
    }
}
