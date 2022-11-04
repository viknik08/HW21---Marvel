//
//  ViewController.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 03.11.2022.
//

import UIKit

class CharactersViewController: UIViewController {

    private var charactersView = CharactersView()
    
//    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Heroes"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarhy()
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
    }

}

//    MARK: - Delegat&DataSource

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier, for: indexPath) as? CharactersTableViewCell
        return cell ?? UITableViewCell()
    }
    

}

