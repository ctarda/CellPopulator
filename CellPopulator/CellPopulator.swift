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
    associatedtype CellType

    func supports(_ object: ModelObject) -> Bool
    func populate(_ cell: CellType, with: ModelObject)
}

// Cell
protocol DataSettableCell {
    associatedtype DataType
    var data: DataType? {get set}
}

extension DataSettableCell {
    static func cellReuseIdentifier() -> String {
        return String(describing: self)
    }
}

// Tag interface
protocol ModelObject {

}


//class BasePopulator: CellPopulator {
//    func supports(_ object: ModelObject) -> Bool {
//        return false
//    }
//
//    func populate(_ cell: UITableViewCell, with: ModelObject) {
//
//    }
//}
// Data
//protocol CellRepresentable {
//    associatedtype DataType
//    var data: DataType? { get }
//}
