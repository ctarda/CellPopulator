//
//  DataSettableCell.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation

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
