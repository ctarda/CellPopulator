import Foundation

final class SectionedDataManager: DataManager {
    fileprivate var data: [Int: [ModelObject]]

    init(data: [Int: [ModelObject]]) {
        self.data = data
    }

    convenience init() {
        self.init(data: [Int: [ModelObject]]())
    }

    func itemCount() -> Int {
        return data.reduce(0, {count, section in
            count + section.1.count
        })
    }

    func itemCount(_ section: Int) -> Int? {
        guard section < data.count else {
            return nil
        }

        return data[section]?.count
    }

    func sectionCount() -> Int {
        return data.count
    }

    func item(_ indexPath: IndexPath) -> ModelObject? {
        return data[indexPath.section]?[indexPath.item]
    }

    func items(section: Int) -> [ModelObject]? {
        guard section < data.count else {
            return nil
        }
        return data[section]
    }
}
