import Foundation

class ShopViewModel: ObservableObject {
    
    @Published private(set) var allItems: [ShopItem] = []
    @Published private(set) var currentItems: [ShopItem] = []
    var userManager: UserManager
    @Published var selectedStick = UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick"

    init(userManager: UserManager) {
        self.userManager = userManager
        loadShopItems()
    }

    private func loadShopItems() {
        allItems = [
            ShopItem(item: "lives_1", count: 1, type: .lives, price: 100),
            ShopItem(item: "lives_3", count: 3, type: .lives, price: 250),
            ShopItem(item: "lives_5", count: 5, type: .lives, price: 400),
            ShopItem(item: "candy_stick", count: 1, type: .sticks, price: 0),
            ShopItem(item: "zephyr_stick", count: 1, type: .sticks, price: 5000),
            ShopItem(item: "waffle_stick", count: 1, type: .sticks, price: 5500),
            ShopItem(item: "cocoa_stick", count: 1, type: .sticks, price: 6000)
        ]
        filterItems(by: .lives)
        saveStick(allItems[3])
    }

    func filterItems(by type: ShopItemType) {
        currentItems = allItems.filter { $0.type == type }
    }

    func purchase(item: ShopItem) -> Bool {
        guard userManager.user.coins >= item.price else {
            return false
        }

        userManager.restCoins(rest: item.price)

        switch item.type {
        case .lives:
            userManager.addLives(add: item.count)
        case .sticks:
            saveStick(item)
        }
        return true
    }

    private func saveStick(_ item: ShopItem) {
        var savedSticks = UserDefaults.standard.array(forKey: "savedSticks") as? [[String: Any]] ?? []
        
        if let existingIndex = savedSticks.firstIndex(where: { $0["item"] as? String == item.item }) {
            savedSticks[existingIndex]["count"] = (savedSticks[existingIndex]["count"] as? Int ?? 0) + item.count
        } else {
            savedSticks.append(["item": item.item, "count": item.count, "price": item.price])
        }
        
        UserDefaults.standard.set(savedSticks, forKey: "savedSticks")
    }
    
    func loadSavedSticks() -> [ShopItem] {
        let savedSticks = UserDefaults.standard.array(forKey: "savedSticks") as? [[String: Any]] ?? []
        return savedSticks.compactMap {
            guard let item = $0["item"] as? String,
                  let count = $0["count"] as? Int,
                  let price = $0["price"] as? Int else { return nil }
            return ShopItem(item: item, count: count, type: .sticks, price: price)
        }
    }
    
}
