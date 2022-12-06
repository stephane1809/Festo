//
//  MenuTableView.swift
//  Festo
//
//  Created by Emilly Maia on 05/12/22.
//

import UIKit

class MenuView: UIView {
    
    lazy var menuTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelection = true
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        return tableView
    }()
    
    lazy var tabBar: UIView = {
        let tabBar = UIView()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 0.8)
        tabBar.layer.borderColor = CGColor(red: 0.69, green: 0.68, blue: 0.68, alpha: 0.88)
        return tabBar
    }()
    
    lazy var nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.tintColor = .systemBackground
        nextButton.backgroundColor = .systemGreen
        nextButton.layer.cornerRadius = 22
        nextButton.setTitle("Pronto!", for: .normal)
        
        let action = UIAction { _ in
//            print(self.menuTableView.indexPathsForSelectedRows)
        }
        nextButton.addAction(action, for: .primaryActionTriggered)
    return nextButton
}()

override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(menuTableView)
    addSubview(tabBar)
    tabBar.addSubview(nextButton)
    configConstraints()
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

// MARK: - Setup constraints
private func configConstraints() {
    NSLayoutConstraint.activate([
        menuTableView.topAnchor.constraint(equalTo: topAnchor),
        menuTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        menuTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        menuTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
    
    NSLayoutConstraint.activate([
        nextButton.topAnchor.constraint(equalTo: topAnchor, constant: 740),
        nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22)
    ])
    
    NSLayoutConstraint.activate([
        tabBar.topAnchor.constraint(equalTo: topAnchor, constant: 730),
        tabBar.leadingAnchor.constraint(equalTo: leadingAnchor),
        tabBar.trailingAnchor.constraint(equalTo: trailingAnchor),
        tabBar.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
}
}
