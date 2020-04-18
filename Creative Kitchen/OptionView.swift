//
//  OptionView.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

class OptionView: UIView {
    public private(set) lazy var label: UILabel = {
        let l = UILabel()

        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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

    public private(set) lazy var toggle: UISwitch = {
        let s = UISwitch()

        s.translatesAutoresizingMaskIntoConstraints = false

        return s
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        addSubview(label)
        addSubview(toggle)

        clipsToBounds = true

        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            toggle.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            toggle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            toggle.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}