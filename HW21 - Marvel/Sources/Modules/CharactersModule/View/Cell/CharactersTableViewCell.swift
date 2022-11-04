//
//  CharactersTableViewCell.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 04.11.2022.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    static let identifier = "charactersTableViewCell"
    
//    MARK: - Outlets
    
    private let viewForImage: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.backgroundColor = .red
        return view
    }()
    private let image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemCyan
        image.layer.cornerRadius = 25
        return image
    }()
    private let lable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "label"
        return label
    }()
    private let discription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "discription"
        return label
    }()
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 10
        return view
    }()
    
//    MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarhy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Setups
    
    private func setupHierarhy() {
        stackView.addArrangedSubview(lable)
        stackView.addArrangedSubview(discription)
        addSubview(viewForImage)
        viewForImage.addSubview(image)
        addSubview(stackView)
    }
    
    private func setupLayout() {
        viewForImage.snp.makeConstraints { make in
            make.left.equalTo(self).offset(20)
            make.height.width.equalTo(60)
            make.centerY.equalTo(self)
        }
        image.snp.makeConstraints { make in
            make.center.equalTo(viewForImage)
            make.height.width.equalTo(50)
        }
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(viewForImage.snp.right).offset(20)
        }
        
    }
    
    // MARK: - Reuse

}
