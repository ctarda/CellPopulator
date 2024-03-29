import Foundation

// MARK: - Model objects
struct Coconut: ModelObject {
    let weight: Int
}

struct Car: ModelObject {
    let make: String
    let model: String
    let wheelCount: Int
}

struct Developer: ModelObject {
    let name: String
    let language: String
}

// MARK: - Data model
final class DataModel {
    // The section order is important, as data will be rendered in this precise order
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
        return [Developer(name: "Archibald", language: "Swift"),
                Developer(name: "Ada", language: "Kotlin")]
    }
}
