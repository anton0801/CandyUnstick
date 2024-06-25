import Foundation

struct ShopItem {
    var id = UUID()
    var item: String
    var count: Int
    var type: ShopItemType
    var price: Int
}

enum ShopItemType {
    case lives, sticks
}
