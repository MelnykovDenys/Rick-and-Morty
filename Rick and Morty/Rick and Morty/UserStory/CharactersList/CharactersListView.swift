//
//  CharactersListView.swift
//  Rick and Morty
//
//  Created by Mac on 07.12.2020.
//

import UIKit

class CharactersListView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        
        addSubview(tableView)
        tableView.register(UINib(nibName: Constants.characterListIdentifier, bundle: nil), forCellReuseIdentifier: Constants.characterListIdentifier)
        pinToEdges(tableView)
    }
    
    func addFooterIndicator() {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 70))
        
        let activityIndicator = UIActivityIndicatorView()
        footerView.addSubview(activityIndicator)
        activityIndicator.center = footerView.center
        activityIndicator.startAnimating()
        
        tableView.tableFooterView = footerView
    }
    
    func removeFooterIndicator() {
        tableView.tableFooterView = nil
    }
}
//

