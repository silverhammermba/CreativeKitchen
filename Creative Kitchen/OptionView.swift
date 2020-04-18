//
//  OptionView.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

/// A reusable view consisting of a switch on the right and a one-line label taking
/// up the reamining room on the left.
///
/// After construction, configure the OptionView via its public properties,
/// set `translatesAutoresizingMaskIntoConstraints = false`, and install constraints
class OptionView: UIView {
    public private(set) lazy var label: UILabel = {
        let l = UILabel()

        l.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        if #available(iOS 13, *) {
            l.textColor = .label
        } else {
            l.textColor = .black
        }
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.allowsDefaultTighteningForTruncation = true
        l.minimumScaleFactor = 0.7
        l.adjustsFontSizeToFitWidth = true
        l.translatesAutoresizingMaskIntoConstraints = false

        return l
    }()

    public private(set) lazy var sublabel: UILabel = {
        let l = UILabel()

        l.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        if #available(iOS 13, *) {
            l.textColor = .secondaryLabel
        } else {
            l.textColor = .gray
        }
        l.numberOfLines = 1
        l.lineBreakMode = .byTruncatingTail
        l.allowsDefaultTighteningForTruncation = true
        l.minimumScaleFactor = 0.7
        l.adjustsFontSizeToFitWidth = true
        l.translatesAutoresizingMaskIntoConstraints = false

        return l
    }()

    public private(set) lazy var toggle: UISwitch = {
        let s = UISwitch()

        s.translatesAutoresizingMaskIntoConstraints = false
        s.addTarget(self, action: #selector(switchToggled(sender:)), for: .valueChanged)

        return s
    }()

    public var toggleAction: (Bool) -> Void = { _ in }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        addSubview(label)
        addSubview(sublabel)
        addSubview(toggle)

        clipsToBounds = true

        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            sublabel.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            sublabel.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            sublabel.topAnchor.constraint(equalTo: label.bottomAnchor),
            sublabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            toggle.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            toggle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            toggle.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    @IBAction func switchToggled(sender: UISwitch) {
        toggleAction(sender.isOn)
    }
}
