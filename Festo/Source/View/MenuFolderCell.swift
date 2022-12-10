//
//  MenuFolderCell.swift
//  Festo
//
//  Created by Emilly Maia on 07/12/22.
//

import UIKit

class MenuFolderCell: UITableViewCell {

    static let identifier = "MenuFolderCell"

    lazy var folder: UIImageView = {
        let folder = UIImageView()
        folder.translatesAutoresizingMaskIntoConstraints = false
        folder.image = UIImage(named: "header")
        return folder
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(folder)
        configConstraints()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            folder.topAnchor.constraint(equalTo: topAnchor, constant: -44),
            folder.leadingAnchor.constraint(equalTo: leadingAnchor),
            folder.trailingAnchor.constraint(equalTo: trailingAnchor),
            folder.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
