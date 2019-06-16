import Foundation

/// Cell
protocol DataSettableCell {
    associatedtype DataType
    var data: DataType? {get set}
}

extension DataSettableCell {
    static func cellReuseIdentifier() -> String {
        return String(describing: self)
    }
}
