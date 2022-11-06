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
        setDelegat()
        presenter?.requestDetail()
    }
    
//    MARK: - Setup
    
    private func setupHierarhy() {
        detailView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(detailView)
    }
    
    private func setDelegat() {
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self
    }
}
//    MARK: - Delegat&DataSource

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ??
            UITableViewCell(style: .default, reuseIdentifier: "cell")
//        let character = presenter?.characters[indexPath.row]
//        cell?.character = character
        cell.textLabel?.text = "No"
        cell.imageView?.image = UIImage(named: "CA")
        cell.backgroundColor = .clear
        cell.accessoryType = .disclosureIndicator
        return cell 
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        }
}

// MARK: - Ext protocol

extension DetailViewController: DetailViewProtocol {
    func setDetail(detail: Character?) {
        guard let detail = detail else { return }
        detailView.detail = detail
    }
}
