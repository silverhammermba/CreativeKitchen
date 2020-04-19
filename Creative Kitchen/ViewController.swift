//
//  ViewController.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

struct OptionViewModel {
    let category: CategoryViewModel
    var value: String
    var frozen: Bool

    mutating func randomize() {
        if !frozen {
            value = category.sample()
        }
    }
}

class ViewController: UIViewController {
    var options: [OptionViewModel] = []
    lazy var table = GenericTableViewController(style: .plain, viewType: OptionView.self)
    lazy var dbHelper = DBHelper(container: (UIApplication.shared.delegate as! AppDelegate).persistentContainer)

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

        let categories: [Category] = (try? dbHelper.container.viewContext.fetch(Category.fetchRequest())) ?? []

        options = categories.sorted(by: { $0.sortOrder < $1.sortOrder }).map { category in
            let opts = category.options.map { $0.name }.sorted()
            let catVm = CategoryViewModel(name: category.name, options: opts)
            return OptionViewModel(category: catVm, value: catVm.sample(), frozen: false)
        }

        table.configureView = { i, v in
            v.label.text = self.options[i.row].value
            v.sublabel.text = self.options[i.row].category.name
            v.toggle.isOn = self.options[i.row].frozen
            v.toggleAction = { self.options[i.row].frozen = $0 }
        }
        table.didSelectView = { i, v in
            self.showCategory(index: i)
        }
        table.numberOfRows = { self.options.count }

        install(table)

        likeButton.layer.cornerRadius = likeButton.frame.width / 2
        dislikeButton.layer.cornerRadius = dislikeButton.frame.width / 2

        view.bringSubviewToFront(likeButton)
        view.bringSubviewToFront(dislikeButton)
    }

    private func showCategory(index: IndexPath) {
        let category = options[index.row].category
        let source = table.view(for: index)!

        let controller = GenericTableViewController(style: .plain, viewType: LabelView.self)
        controller.modalPresentationStyle = .popover
        controller.popoverPresentationController?.sourceView = source
        controller.popoverPresentationController?.sourceRect = source.frame
        controller.configureView = { i, v in
            v.label.text = category.options[i.row]
        }
        controller.didSelectView = { i, v in
            self.options[index.row].value = v.label.text!
            self.table.tableView.reloadRows(at: [index], with: .automatic)
            self.dismiss(animated: true)
        }
        controller.numberOfRows = { category.options.count }
        present(controller, animated: true)
    }
}

