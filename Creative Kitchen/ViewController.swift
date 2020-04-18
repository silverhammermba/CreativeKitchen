//
//  ViewController.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

// TODO: load from DB
let categories = [
    Category(name: "Cuisine", options: [
        "Italian",
        "Mexican",
        "Romanian",
        "Indian",
        "Chinese",
        "Asian",
        "French",
        "American",
        "Japanese",
        "Mediterranean",
        "Moroccan",
    ]),
    Category(name: "Type of Food", options: [
        "Soup",
        "Stew/curry",
        "Salad",
        "Stir Fry",
        "Caserole/Baked dish",
    ]),
    Category(name: "Protein", options: [
        "Mushrooms",
        "Legumes",
        "Eggs",
        "Seafood",
        "Tofu",
        "\"Meat\"",
        "Cheese/dairy",
    ]),
    Category(name: "Carbs", options: [
        "Noodles",
        "Rice/grains",
        "Potato",
        "Bread",
    ]),
    Category(name: "Greens", options: [
        "Leafy Greens",
        "Broccoli",
        "Bok Choy",
        "Seaweed",
        "Collard/mustard greens",
    ]),
]

struct Option {
    let category: Category
    var value: String
    var frozen: Bool

    mutating func randomize() {
        if !frozen {
            value = category.sample()
        }
    }
}

class ViewController: UIViewController {
    var options = categories.map { Option(category: $0, value: $0.sample(), frozen: false)}
    let table = GenericTableViewController(style: .plain, viewType: OptionView.self)

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!

    @IBAction func likePressed(_ sender: Any) {
        // TODO: save as a good combination
    }

    @IBAction func dislikePressed(_ sender: Any) {
        for (index, _) in options.enumerated() {
            options[index].randomize()
        }
        table.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        table.configureView = { i, v in
            v.label.text = self.options[i.row].value
            v.sublabel.text = self.options[i.row].category.name
            v.toggle.isOn = self.options[i.row].frozen
            v.toggleAction = { self.options[i.row].frozen = $0 }
        }
        table.numberOfRows = { self.options.count }
        // TODO: when selecting a row, let you edit it

        install(table)

        likeButton.layer.cornerRadius = likeButton.frame.width / 2
        dislikeButton.layer.cornerRadius = dislikeButton.frame.width / 2

        view.bringSubviewToFront(likeButton)
        view.bringSubviewToFront(dislikeButton)
    }
}

