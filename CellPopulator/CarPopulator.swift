//
//  CarPopulator.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation

struct CarPopulator: CellPopulator {
    func supports(_ object: ModelObject) -> Bool {
        return object is Car
    }

    func populate(_ cell: CarTableViewCell, with: ModelObject) {
        cell.data = with as? Car
    }

    static func build() -> CarPopulator {
        return CarPopulator()
    }
}
