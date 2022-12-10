//
//  CounterViewCell.swift
//  Festo
//
//  Created by Emilly Maia on 10/12/22.
//

import Foundation
import UIKit

class StepperViewCell: UITableViewCell {
    static let identifier = "StepperViewCell"

    var guests: Int = 0 {
        didSet {
            guestsLabel.text = String(guests)
        }
    }

    lazy var buttonMenos: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor(red: 1, green: 0.32, blue: 0.32, alpha: 0.5)
        button.layer.borderWidth = 3
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.diminui), for: .touchUpInside)
        return button
    }()

    lazy var buttonMais: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor(red: 0.78, green: 0.8, blue: 0.23, alpha: 0.5)
        button.layer.borderWidth = 3
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.aumenta), for: .touchUpInside)
        return button
    }()

    lazy var guestsLabel: UILabel = {
        let numberGuests = UILabel()
        numberGuests.translatesAutoresizingMaskIntoConstraints = false
        numberGuests.text = String(guests)
        numberGuests.backgroundColor = .white
        numberGuests.font = UIFont.boldSystemFont(ofSize: 17)
        numberGuests.textColor = .black
        numberGuests.textAlignment = .center
//        numberGuests.numberOfLines = 0
        return numberGuests
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .systemBackground
        layer.cornerRadius = 15
        layer.borderColor = CGColor(red: 0.38, green: 0.4, blue: 0.23, alpha: 1)
        layer.borderWidth = 2
        addSubviews()
        configConstrainstsButtonMenos()
        configConstrainstsButtonMais()
        configConstrainstsLabel()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    private func configConstrainstsLabel() {
        NSLayoutConstraint.activate([
            self.guestsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.guestsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    private func configConstrainstsButtonMenos() {
        NSLayoutConstraint.activate([
            self.buttonMenos.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            self.buttonMenos.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            self.buttonMenos.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            self.buttonMenos.trailingAnchor.constraint(equalTo: guestsLabel.leadingAnchor, constant: 0),
            self.buttonMenos.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func configConstrainstsButtonMais() {
        NSLayoutConstraint.activate([
            self.buttonMais.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            self.buttonMais.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            self.buttonMais.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            self.buttonMais.leadingAnchor.constraint(equalTo: guestsLabel.trailingAnchor, constant: 0),
            self.buttonMais.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func addSubviews() {
        addSubview(buttonMenos)
        addSubview(buttonMais)
        addSubview(guestsLabel)
    }
    @objc func aumenta() {
        if (guests + 1) <= 200 {
            guests+=1
        }
    }
    @objc func diminui() {
        if (guests - 1) >= 0 {
            guests-=1
        }
    }
}
