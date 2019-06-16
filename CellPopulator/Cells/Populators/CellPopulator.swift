import Foundation
import UIKit

/// Abstracts anything that can be initialised via `init()`
protocol Initializable {
    init()
}

/// Cell Populator
protocol CellPopulator: Initializable {
    associatedtype CellType: UITableViewCell, DataSettableCell

    func supports(_ object: ModelObject) -> Bool
    func populate(_ cell: CellType, with: ModelObject)
}

/// Default implementation of the CellPopulator protocol
extension CellPopulator {
    func supports(_ object: ModelObject) -> Bool {
        return object is CellType.DataType
    }

    func populate(_ cell: CellType, with: ModelObject) {
        // Make a mutable copy to prevent a compiler error
        var cell = cell
        cell.data = with as? CellType.DataType
    }
}
