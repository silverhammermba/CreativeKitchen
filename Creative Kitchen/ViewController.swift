//
//  ViewController.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

struct Option {
    let val: Int
    var on: Bool
}

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

        var data = (0..<1000).map { Option(val: $0, on: false) }

        let table = GenericTableViewController(style: .plain, viewType: OptionView.self)
        table.configureView = { i, v in
            v.label.text = "Row \(data[i.row].val)"
            v.toggle.isOn = data[i.row].on
            v.toggleAction = { data[i.row].on = $0 }
        }
        table.numberOfRows = { data.count }


        install(table)
    }
}

