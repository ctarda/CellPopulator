import UIKit

final class CarTableViewCell: UITableViewCell, DataSettableCell {

    @IBOutlet weak var carMake: UILabel!
    
    var data: Car? {
        didSet {
            carMake.text = "Car. Make \(data?.make ?? "") model \(data?.model ?? "")"
        }
    }
}
