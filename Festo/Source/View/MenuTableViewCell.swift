//
//  MenuTableViewCell.swift
//  Festo
//
//  Created by Emilly Maia on 05/12/22.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    static let identifier = "MenuTableViewCell"

    lazy var cell: UIView = {
        let cell = UIView()
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.layer.borderWidth = 2
        cell.layer.borderColor = CGColor(red: 0.38, green: 0.40, blue: 0.23, alpha: 1)
        cell.layer.cornerRadius = 22
        cell.backgroundColor = UIColor(red: 1, green: 0.89, blue: 0.70, alpha: 1)
        return cell
    }()

    lazy var foodImage: UIImageView = {
        let foodImage = UIImageView()
        foodImage.translatesAutoresizingMaskIntoConstraints = false
        return foodImage
    }()

    lazy var foodTitle: UILabel = {
        let foodTitle = UILabel()
        foodTitle.translatesAutoresizingMaskIntoConstraints = false
        foodTitle.font = .systemFont(ofSize: 17, weight: .regular)
        foodTitle.textColor = UIColor(red: 0.24, green: 0.16, blue: 0.13, alpha: 1)
        return foodTitle
    }()

    lazy var checkList: UIImageView = {
           let checkList = UIImageView()
           checkList.translatesAutoresizingMaskIntoConstraints = false
           checkList.tintColor = .black
           return checkList
       }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func setSelected(_ highlighted: Bool, animated: Bool) {
           super.setSelected(highlighted, animated: animated)
           switch highlighted {
           case true:
               checkList.image = UIImage(systemName: "circle.fill")
              // MenuViewController.selectedFood.insert(indexPath)
           case false:
               checkList.image = UIImage(systemName: "circle")
            //  MenuViewController.selectedFood.remove(indexPath)
           }
       }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(cell)
        cell.addSubview(foodTitle)
        cell.addSubview(foodImage)
        cell.addSubview(checkList)
        contentView.backgroundColor = .systemBackground
        configConstraints()

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        foodTitle.text = nil
        foodImage.image = nil
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            foodTitle.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            foodTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 118),
            foodTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -147),
            foodTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -31)
        ])

        NSLayoutConstraint.activate([
            self.foodImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            self.foodImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            self.foodImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -277),
            self.foodImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            cell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            cell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            cell.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([

                  checkList.topAnchor.constraint(equalTo: cell.topAnchor, constant: 24),
                  checkList.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 274),
                  checkList.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -24),
                  checkList.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -28)
              ])
    }

    public func configureCellInformations(text: String, imageName: String) {
        foodTitle.text = text
        foodImage.image = UIImage(named: imageName)
    }
}

extension MenuTableViewCell {
}
