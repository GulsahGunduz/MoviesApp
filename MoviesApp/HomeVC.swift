import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var MoviesCollView: UICollectionView!
    
    var moviesList = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MoviesCollView.delegate = self
        MoviesCollView.dataSource = self

        let m1 = Movies(name: "Interstellar", id: 1, image: "interstellar", price: 70)
        let m2 = Movies(name: "Django", id: 2, image: "django", price: 50)
        let m3 = Movies(name: "The Hatefuleight", id: 3, image: "thehatefuleight", price: 60)
        let m4 = Movies(name: "Inception", id: 4, image: "inception", price: 90)
        let m5 = Movies(name: "Frame", id: 5, image: "anadoluda", price: 55)
        let m6 = Movies(name: "The Pianist", id: 6, image: "thepianist", price: 67)
        
        moviesList.append(m1)
        moviesList.append(m2)
        moviesList.append(m3)
        moviesList.append(m4)
        moviesList.append(m5)
        moviesList.append(m6)
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth-30) / 2
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.4)
        
        MoviesCollView.collectionViewLayout = design
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, CellProtocol{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = moviesList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        
        cell.imgView.image = UIImage(named: movie.image!)
        cell.priceLabel.text = "\(movie.price!) TL"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.4
        cell.layer.cornerRadius = 10.0
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            if let movie = sender as? Movies{
                let dest = segue.destination as! DetailVC
                dest.movie = movie
            }
        }
    }
    
    func addToCartClicked(indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        print("\(movie.name!)")
    }
}

