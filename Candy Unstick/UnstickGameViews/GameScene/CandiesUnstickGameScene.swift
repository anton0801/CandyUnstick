import Foundation
import SpriteKit
import SwiftUI

extension Notification.Name {
    static let gameCandiesDroppedAll = Notification.Name("DROPPED_ALL")
    static let timeout = Notification.Name("TIMEOUT")
    static let restart = Notification.Name("RESTART")
    static let toHome = Notification.Name("TOHOME")
}

class CandiesUnstickGameScene: SKScene {
    
    func restart() -> CandiesUnstickGameScene {
        gameTimer.invalidate()
        let candiesGameScene = CandiesUnstickGameScene()
        view?.presentScene(candiesGameScene)
        return candiesGameScene
    }
    
    var sticks: [SKSpriteNode] = []
    var candies: [SKSpriteNode] = []
    
    private var gameBackground = SKSpriteNode()
    private var homeButton = SKSpriteNode()
    private var restartButton = SKSpriteNode()
    private var soundButton = SKSpriteNode()
    
    private var sound: Bool! {
        didSet {
            if sound {
                let musicBackgroundNode = SKAudioNode(fileNamed: "bg.mp3")
                musicBackgroundNode.name = "background_music"
                addChild(musicBackgroundNode)
                
                let texture = SKTexture(imageNamed: "sound_b")
                soundButton.run(SKAction.setTexture(texture))
            } else {
                for child in children {
                    if child.name == "background_music" {
                        child.removeFromParent()
                    }
                }
                
                let texture = SKTexture(imageNamed: "sound_off_b")
                soundButton.run(SKAction.setTexture(texture))
            }
        }
    }
    
    private var gameTimeLabel = SKLabelNode()
    private var gameTimeLabel2 = SKLabelNode()
    private var coinsLabel = SKLabelNode()
    private var coinsLabel2 = SKLabelNode()
    
    let levelLayouts: [LevelLayout] = [
                LevelLayout1(), LevelLayout2(), LevelLayout3(), LevelLayout4(),
                LevelLayout5(), LevelLayout6(), LevelLayout7(), LevelLayout8(),
                LevelLayout9(), LevelLayout10(), LevelLayout11(), LevelLayout12()
            ]
    
    private var gameTime = 15 {
        didSet {
            gameTimeLabel.text = "00:\(gameTime)"
            gameTimeLabel2.text = "00:\(gameTime)"
            if gameTime == 0 {
                NotificationCenter.default.post(name: .timeout, object: nil)
            }
        }
    }
    private var gameTimer = Timer()
    
    private var coins = UserDefaults.standard.integer(forKey: "coins")
    
    override func didMove(to view: SKView) {
        size = CGSize(width: 750, height: 1335)
        createGameUI()
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if !self.isPaused {
                self.gameTime -= 1
            }
        }
    }
    
    private func createGameUI() {
        let gameBackground: SKSpriteNode = .init(imageNamed: "game_background")
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameBackground.size = size
        addChild(gameBackground)
        
        createButtons()
        createGameHeader()
        setupSticksAndCandies(level: 2)
        
        sound = UserDefaults.standard.bool(forKey: "sound_b")
    }
    
    private func createButtons() {
        homeButton = .init(imageNamed: "home_b")
        homeButton.name = "home_b"
        homeButton.size = CGSize(width: 150, height: 200)
        homeButton.position = CGPoint(x: size.width / 2 - (homeButton.size.width + 80), y: 130)
        addChild(homeButton)
        
        restartButton = .init(imageNamed: "restart_b")
        restartButton.name = "restart_b"
        restartButton.size = CGSize(width: 180, height: 200)
        restartButton.position = CGPoint(x: size.width / 2, y: 130)
        addChild(restartButton)
        
        soundButton = .init(imageNamed: "sound_b")
        soundButton.name = "sound_b"
        soundButton.size = CGSize(width: 150, height: 200)
        soundButton.position = CGPoint(x: size.width / 2 + (soundButton.size.width + 80), y: 130)
        addChild(soundButton)
    }
    
    private func createGameHeader() {
        let timeHolder: SKSpriteNode = .init(imageNamed: "time_background")
        timeHolder.position = CGPoint(x: size.width / 2 - 140, y: size.height - 180)
        timeHolder.size = CGSize(width: 220, height: 100)
        addChild(timeHolder)
        
        let coinsHolder: SKSpriteNode = .init(imageNamed: "coins_background")
        coinsHolder.position = CGPoint(x: size.width / 2 + 140, y: size.height - 180)
        coinsHolder.size = CGSize(width: 220, height: 90)
        addChild(coinsHolder)
        
        gameTimeLabel = .init(text: "00:\(gameTime)")
        gameTimeLabel.position = CGPoint(x: size.width / 2 - 120, y: size.height - 190)
        gameTimeLabel.fontName = "SpicyRice-Regular"
        gameTimeLabel.fontSize = 32
        gameTimeLabel.zPosition = 2
        gameTimeLabel.fontColor = UIColor.init(red: 245/255, green: 220/255, blue: 75/255, alpha: 1)
        addChild(gameTimeLabel)
        
        gameTimeLabel2 = .init(text: "00:\(gameTime)")
        gameTimeLabel2.position = CGPoint(x: size.width / 2 - 119.2, y: size.height - 191)
        gameTimeLabel2.fontName = "SpicyRice-Regular"
        gameTimeLabel2.fontSize = 35
        gameTimeLabel2.zPosition = 1
        gameTimeLabel2.fontColor = UIColor.init(red: 209/255, green: 31/255, blue: 18/255, alpha: 1)
        addChild(gameTimeLabel2)
        
        coinsLabel = .init(text: "\(coins)")
        coinsLabel.position = CGPoint(x: size.width / 2 + 180, y: size.height - 190)
        coinsLabel.fontName = "SpicyRice-Regular"
        coinsLabel.fontSize = 32
        coinsLabel.zPosition = 2
        coinsLabel.fontColor = UIColor.init(red: 245/255, green: 220/255, blue: 75/255, alpha: 1)
        addChild(coinsLabel)
        
        coinsLabel2 = .init(text: "\(coins)")
        coinsLabel2.position = CGPoint(x: size.width / 2 + 180.5, y: size.height - 191)
        coinsLabel2.fontName = "SpicyRice-Regular"
        coinsLabel2.fontSize = 35
        coinsLabel2.zPosition = 1
        coinsLabel2.fontColor = UIColor.init(red: 209/255, green: 31/255, blue: 18/255, alpha: 1)
        addChild(coinsLabel2)
    }

    func setupSticksAndCandies(level: Int) {
        
        sticks.removeAll()
        candies.removeAll()
       
        // Select a random level layout
        let randomIndex = Int(arc4random_uniform(UInt32(levelLayouts.count)))
        let selectedLevelLayout = levelLayouts[randomIndex]
        
        // Set up the selected level
        selectedLevelLayout.setupSticksAndCandies(scene: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = atPoint(location)
        
        if touchedNode.name == "home_b" {
            soundClick()
            NotificationCenter.default.post(name: .toHome, object: nil)
            return
        }
        
        if touchedNode.name == "restart_b" {
            soundClick()
            NotificationCenter.default.post(name: .restart, object: nil)
            return
        }
        
        if touchedNode.name == "sound_b" {
            soundClick()
            sound = !sound
            return
        }
        
        if touchedNode.name == "candy" {
            let stick = touchedNode.userData?["stick"] as! SKSpriteNode
            touchedNode.removeFromParent()
            if areAllCandiesCleared(from: stick) {
                makeStickFall(stick)
            }
            soundClick()
            return
        }
    }
    
    func areAllCandiesCleared() -> Bool {
        return candies.allSatisfy { $0.parent == nil }
    }
    
    func endGame() {
        removeAction(forKey: "timer")
        let gameOverLabel = SKLabelNode(text: "Game Over")
        gameOverLabel.fontSize = 36
        gameOverLabel.fontColor = .red
        gameOverLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameOverLabel)
    }
    
    
    func makeStickFall(_ stick: SKSpriteNode) {
       let fallAction = SKAction.moveBy(x: 0, y: -size.height, duration: 1)
       stick.run(fallAction) {
           stick.removeFromParent()
           self.checkLevelCompletion()
       }
   }
    
    func checkLevelCompletion() {
       if sticks.allSatisfy({ $0.parent == nil }) {
           NotificationCenter.default.post(name: .gameCandiesDroppedAll, object: nil)
       }
   }
    
    func areAllCandiesCleared(from stick: SKSpriteNode) -> Bool {
         let stickCandies = candies.filter { $0.userData?["stick"] as? SKSpriteNode == stick }
         return stickCandies.allSatisfy { $0.parent == nil }
     }
    
    private func soundClick() {
        if sound {
            run(SKAction.playSoundFileNamed("click", waitForCompletion: false))
        }
    }
    
}

#Preview {
    VStack {
        SpriteView(scene: CandiesUnstickGameScene())
            .ignoresSafeArea()
    }
}
