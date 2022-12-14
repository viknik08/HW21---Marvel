//
//  ViewController.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 03.11.2022.
//

import UIKit

class CharactersViewController: UIViewController {

    private var charactersView = CharactersView()
    
    var presenter: CharactersPresenterProtocol?
    
    
//    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarhy()
        setupNavigationBar()
        setDelegat()
    }
    
//    MARK: - Setups
    
    private func setupHierarhy() {
        charactersView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(charactersView)
    }
    
    private func setDelegat() {
        charactersView.tableView.delegate = self
        charactersView.tableView.dataSource = self
        charactersView.searchController.searchBar.delegate = self
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Heroes"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = charactersView.searchController
    }
}

//    MARK: - Delegat&DataSource

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.characters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as? CharactersTableViewCell
        let character = presenter?.characters[indexPath.row]
        cell?.character = character
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detail = presenter?.characters[indexPath.row]
        let viewController = ModuleBuilder.creatDetailModule(detail: detail)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CharactersViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        if text != "" {
            self.presenter?.getCharacters(searchText: text)

        } else {
            presenter?.getCharacters(searchText: nil)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.getCharacters(searchText: nil)
    }
}

extension CharactersViewController: CharactersViewProtocol {
    
    func updateViewData(_ data: ViewData) {
        charactersView.viewData = data
    }
        
    func success() {
        charactersView.tableView.reloadData()
    }
    
    func failure(error: Error) {
        alertErr(title: "Error", message: error.localizedDescription)
    }
    
    func checkRequestResult(isEmpty: Bool) {
        if isEmpty {
            charactersView.tableView.isHidden = true
            charactersView.searchFound.isHidden = false
            alertOk(title: "Error", message: "This heroes not found. Try it again") { [weak self] _ in
                self?.charactersView.searchController.searchBar.text = ""
                self?.presenter?.getCharacters(searchText: nil)
            }
        }
        else {
            charactersView.tableView.isHidden = false
            charactersView.searchFound.isHidden = true
        }
    }
}
