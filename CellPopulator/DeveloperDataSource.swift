//
//  DeveloperDataSource.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation
import UIKit

final class DeveloperDataSource: NSObject, UITableViewDataSource {
    private let dataManager: DataManager
    private let decorating: UITableViewDataSource
    private let populator = DeveloperPopulator()

    init(dataManager: DataManager, decorating: UITableViewDataSource) {
        self.dataManager = dataManager
        self.decorating = decorating
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return decorating.numberOfSections?(in: tableView) ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decorating.tableView(tableView, numberOfRowsInSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let dataItem = dataManager.item(indexPath),
            populator.supports(dataItem) else {
                // Throw an assertion
                return UITableViewCell()
        }

        if let cell = tableView.dequeueReusableCell(withIdentifier: DeveloperTableViewCell.cellReuseIdentifier(), for: indexPath) as? DeveloperTableViewCell {

            populator.populate(cell, with: dataItem)

            return cell
        }

        return UITableViewCell()
    }
}
