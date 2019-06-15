import Foundation

protocol DataManager {
    func itemCount() -> Int

    func itemCount(_ section: Int) -> Int?

    func sectionCount() -> Int

    func item(_ indexPath: IndexPath) -> ModelObject?

    func items(section: Int) -> [ModelObject]?
}
