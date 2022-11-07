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
                comicsList.text = detail.comics.items.map {$0.name}.joined(separator: ", \n")
                guard let imageLink = URL(string: String.getUrlString(image: detail.thumbnail, variant: ImageVarians.standardExtraLarge)) else { return }
                backgroundImage.load(url: imageLink)
            }
        }
    }
    
//    MARK: - Outlets

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
        label.font = .systemFont(ofSize: 16 , weight: .medium)
        return label
    }()
    
    private let comicsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Comics List:"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let comicsList: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16 , weight: .medium)
        return label
    }()
    
    private let backgroundImage: ImageViewWithGradient = {
        let image = ImageViewWithGradient(frame: .zero)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
//    MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHierarhy()
        setupLayout()
    }
    
//    MARK: - Setups
    private func setupHierarhy() {
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(comicsLabel)
        addSubview(comicsList)
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
        comicsLabel.snp.makeConstraints { make in
            make.left.equalTo(backgroundImage).offset(20)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(40)
        }
        comicsList.snp.makeConstraints { make in
            make.left.equalTo(backgroundImage).offset(20)
            make.right.equalTo(backgroundImage).offset(-20)
            make.top.equalTo(comicsLabel.snp.bottom).offset(10)

        }
    }
}
