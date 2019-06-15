//
//  CoconutTableViewCell.swift
//  DataSources
//
//  Created by Cesar Tardaguila on 1/6/2019.
//  Copyright © 2019 bambooapps. All rights reserved.
//

import UIKit

final class CoconutTableViewCell: UITableViewCell, DataSettableCell {
    @IBOutlet weak var weight: UILabel!
    
    var data: Coconut? {
        didSet {
            weight.text = "weight \(data?.weight ?? 0)"
        }
    }
    
}
