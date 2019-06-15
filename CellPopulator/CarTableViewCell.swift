//
//  CarTableViewCell.swift
//  DataSources
//
//  Created by Cesar Tardaguila on 1/6/2019.
//  Copyright © 2019 bambooapps. All rights reserved.
//

import UIKit

final class CarTableViewCell: UITableViewCell, DataSettableCell {

    @IBOutlet weak var carMake: UILabel!
    
    var data: Car? {
        didSet {
            carMake.text = data?.make
        }
    }
}
