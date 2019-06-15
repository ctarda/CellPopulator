//
//  CarPopulator.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation

struct CarPopulator: CellPopulator {
    typealias CellType = CarTableViewCell

    static func build() -> CarPopulator {
        return CarPopulator()
    }
}
