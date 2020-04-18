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

        let data = (0..<1000).map { $0 }

        let table = GenericTableViewController(style: .plain, viewType: OptionView.self)
        table.configureView = { i, v in
            v.label.text = "Row \(data[i.row])"
            v.toggle.isOn = false
        }
        table.numberOfRows = { data.count }


        install(table)
    }
}

