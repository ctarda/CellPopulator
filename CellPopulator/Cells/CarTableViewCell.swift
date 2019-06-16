import UIKit

final class CarTableViewCell: UITableViewCell, DataSettableCell {

    @IBOutlet weak var carMake: UILabel!
    
    var data: Car? {
        didSet {
            carMake.text = data?.make
        }
    }
}
