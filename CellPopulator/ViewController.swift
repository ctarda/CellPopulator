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

    private func registerCells() {
        let cellIdentifier = CoconutTableViewCell.cellReuseIdentifier()
        let nibName = UINib(nibName: cellIdentifier, bundle: nil)
        table.register(nibName, forCellReuseIdentifier: cellIdentifier)

        let devCellIdentifier = DeveloperTableViewCell.cellReuseIdentifier()
        let devNibName = UINib(nibName: devCellIdentifier, bundle: nil)
        table.register(devNibName, forCellReuseIdentifier: devCellIdentifier)

        let carCellIdentifier = CarTableViewCell.cellReuseIdentifier()
        let carNibName = UINib(nibName: carCellIdentifier, bundle: nil)
        table.register(carNibName, forCellReuseIdentifier: carCellIdentifier)
    }

    private func prepareDataSource() {
        let data = DataModel().data()
        let dataManager = SectionedDataManager(data: data)
        let coconutDataSource = DecorableDataSource(dataManager: dataManager,
                                                     cellType: CoconutTableViewCell.self,
                                                     populator: CoconutPopulator())

        let developerDataSource = DecorableDataSource(dataManager: dataManager,
                                                     cellType: DeveloperTableViewCell.self,
                                                     populator: DeveloperPopulator(),
                                                     decorating: coconutDataSource)

        let carDataSource = DecorableDataSource(dataManager: dataManager,
                                                       cellType: CarTableViewCell.self,
                                                       populator: CarPopulator(),
                                                       decorating: developerDataSource)

        //dataSource = coconutDataSource
        dataSource = carDataSource

        table.dataSource = dataSource
    }
}

