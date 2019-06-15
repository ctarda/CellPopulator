//
//  CoconutTableViewCell.swift
//  DataSources
//
//  Created by Cesar Tardaguila on 1/6/2019.
//  Copyright © 2019 bambooapps. All rights reserved.
//

import UIKit

class CoconutTableViewCell: UITableViewCell, DataSettableCell {
    @IBOutlet weak var weight: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var data: Coconut? {
        didSet {
            //carMake.text = data?.make
            //print("==== did set ", data?.weight)
            weight.text = "weight \(data?.weight ?? 0)"
        }
    }
    
}
