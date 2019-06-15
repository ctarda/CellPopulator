//
//  CoconutPopulator.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation

struct CoconutPopulator: CellPopulator {
    func supports(_ object: ModelObject) -> Bool {
        return object is Coconut
    }

    func populate(_ cell: CoconutTableViewCell, with: ModelObject) {
        cell.data = with as? Coconut
    }
}
