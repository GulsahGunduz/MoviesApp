import Foundation

class Movies{
    var name: String?
    var id: Int?
    var image: String?
    var price: Int?
    
    init(){
        
    }
    
    init(name: String, id: Int, image: String, price: Int) {
        self.name = name
        self.id = id
        self.image = image
        self.price = price
    }
}



