import Foundation

enum Tag: String, Decodable {
    case lowPrice = "Удар по ценам"
    case cardPrice = "Цена по карте"
    case new = "Новинки"
}

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let discount: Double?
    let countryOfOrigin: String
    let rating: Double
    let reviews: Int
    let specialTag: Tag?
    let imageName: String
//    var inCart: Int
}
