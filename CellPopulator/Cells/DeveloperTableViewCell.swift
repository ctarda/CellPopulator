import UIKit

final class DeveloperTableViewCell: UITableViewCell, DataSettableCell {
    @IBOutlet weak var developerName: UILabel!
    
    var data: Developer? {
        didSet {
            developerName.text = "A Developer named \(data?.name ?? "")"
        }
    }    
}
