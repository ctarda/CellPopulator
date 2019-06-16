//
//  CellPopulator.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation
import UIKit

protocol Initializable {
    init()
}

// Cell Populator
protocol CellPopulator: Initializable {
    associatedtype CellType: UITableViewCell, DataSettableCell

    func supports(_ object: ModelObject) -> Bool
    func populate(_ cell: CellType, with: ModelObject)
}

extension CellPopulator {
    func supports(_ object: ModelObject) -> Bool {
        return object is CellType.DataType
    }

    func populate(_ cell: CellType, with: ModelObject) {
        // Make a mutable copy to prevent a compiler error
        var cell = cell
        cell.data = with as? CellType.DataType
    }
}
