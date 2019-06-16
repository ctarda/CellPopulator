import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!

    private var dataSource: UITableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()

        prepareDataSource()
    }
}

// MARK: - Cell registration
private extension ViewController {
    private func registerCells() {
        registerCoconutCell()
        registerDevCell()
        registerCarCell()
    }

    private func registerCoconutCell() {
        registerCell(type: CoconutTableViewCell.self)
    }

    private func registerDevCell() {
        registerCell(type: DeveloperTableViewCell.self)
    }

    private func registerCarCell() {
        registerCell(type: CarTableViewCell.self)
    }

    private func registerCell<T: DataSettableCell>(type: T.Type) {
        let identifier = type.cellReuseIdentifier()
        let nibName = UINib(nibName: identifier, bundle: nil)
        table.register(nibName, forCellReuseIdentifier: identifier)
    }
}

// MARK: - Build datasource
private extension ViewController {
    private func prepareDataSource() {
        let data = DataModel().data()
        let dataManager = SectionedDataManager(data: data)

        let coconuts = buildDataSource(dataManager: dataManager,
                                       cellType: CoconutTableViewCell.self,
                                       populator: CoconutPopulator.self)
        let developers = buildDataSource(dataManager: dataManager,
                                         cellType: DeveloperTableViewCell.self,
                                         populator: DeveloperPopulator.self,
                                         decorating: coconuts)
        let cars = buildDataSource(dataManager: dataManager,
                                   cellType: CarTableViewCell.self,
                                   populator: CarPopulator.self,
                                   decorating: developers)

        dataSource = cars

        table.dataSource = dataSource
    }

    private func buildDataSource<Cell, Populator: CellPopulator>(dataManager: DataManager,
                                                                                   cellType: Cell.Type,
                                                                                   populator: Populator.Type,
                                                                                   decorating: UITableViewDataSource? = nil) -> UITableViewDataSource where Populator.CellType == Cell {
        return DecorableDataSource(dataManager: dataManager,
                            cellType: cellType,
                            populator: populator,
                            decorating: decorating)
    }
}
