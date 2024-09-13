import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var imgViewMovie: UIImageView!
    @IBOutlet weak var priceMovie: UILabel!
    
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = movie{
            movieLabel.text = m.name
            imgViewMovie.image = UIImage(named: m.image!)
            priceMovie.text = "\(m.price!) TL"
        }

    }
    

   

}
