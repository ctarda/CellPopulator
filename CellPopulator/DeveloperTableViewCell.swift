//
//  DeveloperTableViewCell.swift
//  DataSources
//
//  Created by Cesar Tardaguila on 1/6/2019.
//  Copyright © 2019 bambooapps. All rights reserved.
//

import UIKit

final class DeveloperTableViewCell: UITableViewCell, DataSettableCell {
    @IBOutlet weak var developerName: UILabel!
    
    var data: Developer? {
        didSet {
            developerName.text = data?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
