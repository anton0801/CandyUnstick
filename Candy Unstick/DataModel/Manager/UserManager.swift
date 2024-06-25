import Foundation

class UserManager: ObservableObject {
    
    @Published var user: UserModel = UserModel(coins: UserDefaults.standard.integer(forKey: "coins"), lives: UserDefaults.standard.integer(forKey: "lives"))
    
    init() {
        if user.lives == 0 && user.coins == 0 {
            self.user = UserModel(coins: 0, lives: 5)
            UserDefaults.standard.set(5, forKey: "lives")
        }
    }
    
    func addCoins(add coins: Int) {
        user = UserModel(coins: user.coins + coins, lives: user.lives)
        UserDefaults.standard.set(user.coins, forKey: "coins")
    }
    
    func restCoins(rest coins: Int) {
        user = UserModel(coins: user.coins - coins, lives: user.lives)
        UserDefaults.standard.set(user.coins, forKey: "coins")
    }
    
    func addLives(add lives: Int) {
        user = UserModel(coins: user.coins, lives: user.lives + lives)
        UserDefaults.standard.set(user.lives, forKey: "lives")
    }
    
    func restLives(rest lives: Int) {
        user = UserModel(coins: user.coins, lives: user.lives - lives)
        UserDefaults.standard.set(user.lives, forKey: "lives")
    }
    
}
