//
//  ViewController.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    public enum State {
        case loading(message: String)
        case idea(controller: IdeaViewController)
        case edit(controller: CategoryEditViewController)
    }

    public var state: State = .loading(message: "Loading...") {
        didSet {
            applyState()
        }
    }

    func applyState() {
        switch state {
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let option = OptionView(frame: view.frame)
        option.label.text = "Oh my isn't this really long text going to run off the end of the screen?"
        option.toggle.isOn = false
        option.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(option)

        NSLayoutConstraint.activate([
            option.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            option.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            option.topAnchor.constraint(equalTo: view.centerYAnchor, constant: view.safeAreaInsets.top),
        ])
    }


}

