//
//  StepperGuestsView.swift
//  Festo
//
//  Created by Emilly Maia on 05/12/22.
//

import UIKit

class StepperGuestsView: UITableViewCell {

    var identifier = "StepperGuestsView"

    lazy var guestStepper: UIStepper = {
        let guestStepper = UIStepper()
        guestStepper.minimumValue = 0
        guestStepper.maximumValue = 200
        return guestStepper
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}
