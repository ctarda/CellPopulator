import UIKit

final class CoconutTableViewCell: UITableViewCell, DataSettableCell {
    @IBOutlet weak var weight: UILabel!
    
    var data: Coconut? {
        didSet {
            weight.text = "weight \(data?.weight ?? 0)"
        }
    }    
}
