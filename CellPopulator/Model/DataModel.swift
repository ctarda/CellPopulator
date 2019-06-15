//
//  DataModel.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import Foundation
struct Coconut {
    let weight: Int
}

extension Coconut: ModelObject {}

struct Car {
    let make: String
    let model: String
    let wheelCount: Int
}

extension Car: ModelObject {}

struct Developer {
    let name: String
    let language: String
}

extension Developer: ModelObject {}

final class DataModel {
    func data() -> [Int: [ModelObject]] {
        return [0: twoCoconuts(),
                1: oneCar(),
                2: twoDevelopers()]
    }

    func twoCoconuts() -> [ModelObject] {
        return [Coconut(weight: 1),
                Coconut(weight: 2)]
    }

    func oneCar() -> [ModelObject] {
        return [Car(make: "Renault",
                    model: "Scenic",
                    wheelCount: 4)]
    }

    func twoDevelopers() -> [ModelObject] {
        return [Developer(name: "Dev 1", language: "Swift"),
                Developer(name: "Dev 2", language: "Kotlin")]
    }
}
