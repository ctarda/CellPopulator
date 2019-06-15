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

    static func build() -> Self
}
