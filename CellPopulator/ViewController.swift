//
//  ViewController.swift
//  CellPopulator
//
//  Created by Cesar Tardaguila on 15/6/2019.
//  Copyright © 2019 automattic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!

    private var dataSource: UITableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        registerCells()

        prepareDataSource()
    }
}

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

private extension ViewController {
    private func prepareDataSource() {
        let data = DataModel().data()
        let dataManager = SectionedDataManager(data: data)
        let coconutDataSource = DecorableDataSource(dataManager: dataManager,
                                                    cellType: CoconutTableViewCell.self,
                                                    populator: CoconutPopulator.self)

        let developerDataSource = DecorableDataSource(dataManager: dataManager,
                                                      cellType: DeveloperTableViewCell.self,
                                                      populator: DeveloperPopulator.self,
                                                      decorating: coconutDataSource)

        let carDataSource = DecorableDataSource(dataManager: dataManager,
                                                cellType: CarTableViewCell.self,
                                                populator: CarPopulator.self,
                                                decorating: developerDataSource)

        dataSource = carDataSource

        table.dataSource = dataSource
    }
}
