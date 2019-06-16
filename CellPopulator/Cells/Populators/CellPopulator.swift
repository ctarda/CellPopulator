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

    /// Declared as part of the protocol to be able to inistantiate in an extension
    init()
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

    static func build() -> Self {
        Self.init()
    }
}
