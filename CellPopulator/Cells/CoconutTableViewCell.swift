import UIKit

final class CoconutTableViewCell: UITableViewCell, DataSettableCell {
    @IBOutlet weak var weight: UILabel!
    
    var data: Coconut? {
        didSet {
            weight.text = "Coconut of weight: \(data?.weight ?? 0)"
        }
    }    
}
