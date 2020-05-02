//
//  LabelView.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

/// A reusable view that is just a one-line label with some padding around it
class LabelView: UIView {
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

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    private func setup() {
        addSubview(label)

        clipsToBounds = true

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
}
