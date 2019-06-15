//
//  TypeErasedDataSource.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation
import UIKit

final class TypeErasedDataSource<Cell, Populator>: NSObject, UITableViewDataSource where Cell: DataSettableCell, Cell: UITableViewCell, Populator: CellPopulator, Populator.CellType == Cell {

    private let dataManager: DataManager
    private let populator: Populator
    private let decorating: UITableViewDataSource?
    

    init(dataManager: DataManager,
         cellType: Cell.Type,
         populator: Populator,
         decorating: UITableViewDataSource? = nil) {
        self.dataManager = dataManager
        self.populator = populator
        self.decorating = decorating
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataManager.sectionCount()
//        guard let decorating = decorating else {
//            return dataManager.sectionCount()
//        }
//
//        return decorating.numberOfSections?(in: tableView) ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.itemCount(section) ?? 0
//        guard let decorating = decorating else {
//            return dataManager.itemCount(section) ?? 0
//        }
//        return decorating.tableView(tableView, numberOfRowsInSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let dataItem = dataManager.item(indexPath),
            populator.supports(dataItem) else {
            return decorating?.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
        }

        if let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellReuseIdentifier(), for: indexPath) as? Cell {

            populator.populate(cell, with: dataItem)

            return cell
        }

        // Throw an assertion
        print("==== returning empty cell ====")
        return UITableViewCell()
    }
}