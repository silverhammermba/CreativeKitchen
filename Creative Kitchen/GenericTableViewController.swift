//
//  GenericTableViewController.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

/// A table view that contains any kind of view in its cells, reconfigurable on the fly
/// by changing the public callback properties
class GenericTableViewController<V: UIView, C: ContainerTableViewCell<V>>: UITableViewController {
    public init(style: UITableView.Style, viewType: V.Type) {
        // viewType is unused, but it spares us from using the full generic syntax when initializing
        super.init(style: style)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }

    public var numberOfRows: () -> Int = { 0 } {
        didSet {
            tableView.reloadData()
        }
    }

    public var configureView: (IndexPath, V) -> () = { _, _ in } {
        didSet {
            tableView.reloadData()
        }
    }

    public var didSelectView: (IndexPath, V) -> () = { _, _ in }

    public override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(C.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? C else {
            fatalError("Unexpected cell type from table view")
        }

        configureView(indexPath, cell.view)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? C else { return }

        didSelectView(indexPath, cell.view)
    }
}
