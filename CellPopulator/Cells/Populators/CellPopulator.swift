//
//  CellPopulator.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation
import UIKit

// Cell Populator
protocol CellPopulator {
    associatedtype CellType: UITableViewCell, DataSettableCell

    func supports(_ object: ModelObject) -> Bool
    func populate(_ cell: CellType, with: ModelObject)

    static func build() -> Self
}

extension CellPopulator {
    func supports(_ object: ModelObject) -> Bool {
        return object is CellType.DataType
    }

    func populate(_ cell: CellType, with: ModelObject) {
        var cell = cell
        cell.data = with as? CellType.DataType
    }
}
