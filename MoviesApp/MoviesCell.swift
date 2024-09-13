import UIKit

protocol CellProtocol{
    func addToCartClicked(indexPath: IndexPath)
}

class MoviesCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    @IBAction func ButtonAddToCart(_ sender: Any) {
        
        cellProtocol?.addToCartClicked(indexPath: indexPath!)
    }
    
    
    
    
}
