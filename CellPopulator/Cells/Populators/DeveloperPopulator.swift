//
//  DeveloperPopulator.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation

struct DeveloperPopulator: CellPopulator {
    func supports(_ object: ModelObject) -> Bool {
        return object is Developer
    }

    func populate(_ cell: DeveloperTableViewCell, with: ModelObject) {
        cell.data = with as? Developer
    }

    static func build() -> DeveloperPopulator {
        return DeveloperPopulator()
    }
}
