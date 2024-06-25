import Foundation
import SpriteKit

protocol LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene)
}

class LevelLayout1: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        for i in 0..<3 {
            let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
            stick.size = CGSize(width: stickWidth, height: stickHeight)
            stick.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2 - CGFloat(i * 100))
            stick.name = "stick"
            scene.sticks.append(stick)
            scene.addChild(stick)

            for j in 0..<3 {
                let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                candy.size = CGSize(width: candySize, height: candySize)
                candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick.position.y)
                candy.name = "candy"
                candy.userData = ["stick": stick]
                scene.candies.append(candy)
                scene.addChild(candy)
            }
        }
    }
}

// Update other level layouts similarly...

class LevelLayout2: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        for i in 0..<2 {
            for j in 0..<2 {
                let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
                stick.size = CGSize(width: stickWidth, height: stickHeight)
                stick.position = CGPoint(x: scene.size.width / 2 + CGFloat(i * 150 - 75), y: scene.size.height / 2 + CGFloat(j * 150 - 75))
                stick.name = "stick"
                scene.sticks.append(stick)
                scene.addChild(stick)

                for k in 0..<3 {
                    let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                    candy.size = CGSize(width: candySize, height: candySize)
                    candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(k) * (candySize + 10), y: stick.position.y)
                    candy.name = "candy"
                    candy.userData = ["stick": stick]
                    scene.candies.append(candy)
                    scene.addChild(candy)
                }
            }
        }
    }
}

// Add more level layouts here...
class LevelLayout3: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Horizontal zigzag
        for i in 0..<4 {
            let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
            stick.size = CGSize(width: stickWidth, height: stickHeight)
            let offsetX = (i % 2 == 0) ? -100 : 100
            stick.position = CGPoint(x: scene.size.width / 2 + CGFloat(offsetX), y: scene.size.height / 2 - CGFloat(i * 100))
            stick.name = "stick"
            scene.sticks.append(stick)
            scene.addChild(stick)

            for j in 0..<3 {
                let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                candy.size = CGSize(width: candySize, height: candySize)
                candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick.position.y)
                candy.name = "candy"
                candy.userData = ["stick": stick]
                scene.candies.append(candy)
                scene.addChild(candy)
            }
        }
    }
}

class LevelLayout4: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Vertical zigzag
        for i in 0..<4 {
            let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
            stick.size = CGSize(width: stickWidth, height: stickHeight)
            let offsetY = (i % 2 == 0) ? -50 : 50
            stick.position = CGPoint(x: scene.size.width / 2 + CGFloat(i * 150 - 225), y: scene.size.height / 2 + CGFloat(offsetY))
            stick.name = "stick"
            scene.sticks.append(stick)
            scene.addChild(stick)

            for j in 0..<3 {
                let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                candy.size = CGSize(width: candySize, height: candySize)
                candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick.position.y)
                candy.name = "candy"
                candy.userData = ["stick": stick]
                scene.candies.append(candy)
                scene.addChild(candy)
            }
        }
    }
}

class LevelLayout5: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Square with internal cross
        for i in 0..<2 {
            for j in 0..<2 {
                let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
                stick.size = CGSize(width: stickWidth, height: stickHeight)
                stick.position = CGPoint(x: scene.size.width / 2 + CGFloat(i * 200 - 100), y: scene.size.height / 2 + CGFloat(j * 200 - 100))
                stick.name = "stick"
                scene.sticks.append(stick)
                scene.addChild(stick)

                for k in 0..<3 {
                    let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                    candy.size = CGSize(width: candySize, height: candySize)
                    candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(k) * (candySize + 10), y: stick.position.y)
                    candy.name = "candy"
                    candy.userData = ["stick": stick]
                    scene.candies.append(candy)
                    scene.addChild(candy)
                }
            }
        }

        let horizontalStick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
        horizontalStick.size = CGSize(width: stickWidth, height: stickHeight)
        horizontalStick.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        horizontalStick.name = "stick"
        scene.sticks.append(horizontalStick)
        scene.addChild(horizontalStick)

        let verticalStick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
        verticalStick.size = CGSize(width: stickHeight, height: stickWidth)
        verticalStick.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        verticalStick.name = "stick"
        scene.sticks.append(verticalStick)
        scene.addChild(verticalStick)

        for k in 0..<3 {
            let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
            candy.size = CGSize(width: candySize, height: candySize)
            candy.position = CGPoint(x: horizontalStick.position.x - stickWidth / 2 + CGFloat(k) * (candySize + 10), y: horizontalStick.position.y)
            candy.name = "candy"
            candy.userData = ["stick": horizontalStick]
            scene.candies.append(candy)
            scene.addChild(candy)
        }

        for k in 0..<3 {
            let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
            candy.size = CGSize(width: candySize, height: candySize)
            candy.position = CGPoint(x: verticalStick.position.x, y: verticalStick.position.y - stickWidth / 2 + CGFloat(k) * (candySize + 10))
            candy.name = "candy"
            candy.userData = ["stick": verticalStick]
            scene.candies.append(candy)
            scene.addChild(candy)
        }
    }
}


// Add more level layouts here...

class LevelLayout6: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Square with internal cross
        for i in 0..<2 {
            for j in 0..<2 {
                let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
                stick.size = CGSize(width: stickWidth, height: stickHeight)
                stick.position = CGPoint(x: scene.size.width / 2 + CGFloat(i * 200 - 100), y: scene.size.height / 2 + CGFloat(j * 200 - 100))
                stick.name = "stick"
                scene.sticks.append(stick)
                scene.addChild(stick)

                for k in 0..<3 {
                    let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                    candy.size = CGSize(width: candySize, height: candySize)
                    candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(k) * (candySize + 10), y: stick.position.y)
                    candy.name = "candy"
                    candy.userData = ["stick": stick]
                    scene.candies.append(candy)
                    scene.addChild(candy)
                }
            }
        }

        let horizontalStick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
        horizontalStick.size = CGSize(width: stickWidth, height: stickHeight)
        horizontalStick.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        horizontalStick.name = "stick"
        scene.sticks.append(horizontalStick)
        scene.addChild(horizontalStick)

        let verticalStick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
        verticalStick.size = CGSize(width: stickHeight, height: stickWidth)
        verticalStick.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        verticalStick.name = "stick"
        scene.sticks.append(verticalStick)
        scene.addChild(verticalStick)

        for k in 0..<3 {
            let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
            candy.size = CGSize(width: candySize, height: candySize)
            candy.position = CGPoint(x: horizontalStick.position.x - stickWidth / 2 + CGFloat(k) * (candySize + 10), y: horizontalStick.position.y)
            candy.name = "candy"
            candy.userData = ["stick": horizontalStick]
            scene.candies.append(candy)
            scene.addChild(candy)
        }

        for k in 0..<3 {
            let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
            candy.size = CGSize(width: candySize, height: candySize)
            candy.position = CGPoint(x: verticalStick.position.x, y: verticalStick.position.y - stickWidth / 2 + CGFloat(k) * (candySize + 10))
            candy.name = "candy"
            candy.userData = ["stick": verticalStick]
            scene.candies.append(candy)
            scene.addChild(candy)
        }
    }
}

class LevelLayout7: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Snake-like pattern
        for i in 0..<4 {
            let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
            stick.size = CGSize(width: stickWidth, height: stickHeight)
            stick.position = CGPoint(x: scene.size.width / 2 + CGFloat(i * 50 - 100), y: scene.size.height / 2)
            stick.name = "stick"
            scene.sticks.append(stick)
            scene.addChild(stick)

            for j in 0..<3 {
                let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                candy.size = CGSize(width: candySize, height: candySize)
                candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick.position.y)
                candy.name = "candy"
                candy.userData = ["stick": stick]
                scene.candies.append(candy)
                scene.addChild(candy)
            }
        }
    }
}

class LevelLayout8: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Diagonal pattern
        for i in 0..<4 {
            let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
            stick.size = CGSize(width: stickWidth, height: stickHeight)
            stick.position = CGPoint(x: scene.size.width / 2 + CGFloat(i * 50 - 100), y: scene.size.height / 2 + CGFloat(i * 50 - 100))
            stick.name = "stick"
            scene.sticks.append(stick)
            scene.addChild(stick)

            for j in 0..<3 {
                let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                candy.size = CGSize(width: candySize, height: candySize)
                candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick.position.y)
                candy.name = "candy"
                candy.userData = ["stick": stick]
                scene.candies.append(candy)
                scene.addChild(candy)
            }
        }
    }
}

class LevelLayout9: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Cross pattern
        let centerX = scene.size.width / 2
        let centerY = scene.size.height / 2

        let horizontalStick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
        horizontalStick.size = CGSize(width: stickWidth, height: stickHeight)
        horizontalStick.position = CGPoint(x: centerX, y: centerY)
        horizontalStick.name = "stick"
        scene.sticks.append(horizontalStick)
        scene.addChild(horizontalStick)

        let verticalStick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
        verticalStick.size = CGSize(width: stickHeight, height: stickWidth)
        verticalStick.position = CGPoint(x: centerX, y: centerY)
        verticalStick.name = "stick"
        scene.sticks.append(verticalStick)
        scene.addChild(verticalStick)

        for k in 0..<3 {
            let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
            candy.size = CGSize(width: candySize, height: candySize)
            candy.position = CGPoint(x: horizontalStick.position.x - stickWidth / 2 + CGFloat(k) * (candySize + 10), y: horizontalStick.position.y)
            candy.name = "candy"
            candy.userData = ["stick": horizontalStick]
            scene.candies.append(candy)
            scene.addChild(candy)
        }

        for k in 0..<3 {
            let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
            candy.size = CGSize(width: candySize, height: candySize)
            candy.position = CGPoint(x: verticalStick.position.x, y: verticalStick.position.y - stickWidth / 2 + CGFloat(k) * (candySize + 10))
            candy.name = "candy"
            candy.userData = ["stick": verticalStick]
            scene.candies.append(candy)
            scene.addChild(candy)
        }
    }
}
class LevelLayout10: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Double vertical sticks
        for i in 0..<2 {
            let stick1 = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
            stick1.size = CGSize(width: stickWidth, height: stickHeight)
            stick1.position = CGPoint(x: scene.size.width / 2 - 100 + CGFloat(i * 200), y: scene.size.height / 2)
            stick1.name = "stick"
            scene.sticks.append(stick1)
            scene.addChild(stick1)

            for j in 0..<3 {
                let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                candy.size = CGSize(width: candySize, height: candySize)
                candy.position = CGPoint(x: stick1.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick1.position.y)
                candy.name = "candy"
                candy.userData = ["stick": stick1]
                scene.candies.append(candy)
                scene.addChild(candy)
            }

            if i == 0 {
                let stick2 = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
                stick2.size = CGSize(width: stickWidth, height: stickHeight)
                stick2.position = CGPoint(x: scene.size.width / 2 + 100, y: scene.size.height / 2)
                stick2.name = "stick"
                scene.sticks.append(stick2)
                scene.addChild(stick2)

                for j in 0..<3 {
                    let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                    candy.size = CGSize(width: candySize, height: candySize)
                    candy.position = CGPoint(x: stick2.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick2.position.y)
                    candy.name = "candy"
                    candy.userData = ["stick": stick2]
                    scene.candies.append(candy)
                    scene.addChild(candy)
                }
            }
        }
    }
}

class LevelLayout11: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Diagonal with staggered candies
        for i in 0..<4 {
            let stick = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
            stick.size = CGSize(width: stickWidth, height: stickHeight)
            stick.position = CGPoint(x: scene.size.width / 2 + CGFloat(i * 50 - 100), y: scene.size.height / 2 + CGFloat(i * 25 - 50))
            stick.name = "stick"
            scene.sticks.append(stick)
            scene.addChild(stick)

            for j in 0..<3 {
                let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                candy.size = CGSize(width: candySize, height: candySize)
                candy.position = CGPoint(x: stick.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick.position.y)
                candy.name = "candy"
                candy.userData = ["stick": stick]
                scene.candies.append(candy)
                scene.addChild(candy)
            }
        }
    }
}

class LevelLayout12: LevelLayout {
    func setupSticksAndCandies(scene: CandiesUnstickGameScene) {
        let stickWidth: CGFloat = 200
        let stickHeight: CGFloat = 20
        let candySize: CGFloat = 40

        // Staggered vertical sticks with cross candies
        for i in 0..<3 {
            let stick1 = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
            stick1.size = CGSize(width: stickWidth, height: stickHeight)
            stick1.position = CGPoint(x: scene.size.width / 2 - 100 + CGFloat(i * 100), y: scene.size.height / 2)
            stick1.name = "stick"
            scene.sticks.append(stick1)
            scene.addChild(stick1)

            for j in 0..<3 {
                let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                candy.size = CGSize(width: candySize, height: candySize)
                candy.position = CGPoint(x: stick1.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick1.position.y)
                candy.name = "candy"
                candy.userData = ["stick": stick1]
                scene.candies.append(candy)
                scene.addChild(candy)
            }

            if i == 1 {
                let stick2 = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "stick_selected") ?? "base_stick")
                stick2.size = CGSize(width: stickWidth, height: stickHeight)
                stick2.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
                stick2.name = "stick"
                scene.sticks.append(stick2)
                scene.addChild(stick2)

                for j in 0..<3 {
                    let candy = SKSpriteNode(imageNamed: UserDefaults.standard.string(forKey: "candy_selected") ?? "base_candy")
                    candy.size = CGSize(width: candySize, height: candySize)
                    candy.position = CGPoint(x: stick2.position.x - stickWidth / 2 + CGFloat(j) * (candySize + 10), y: stick2.position.y)
                    candy.name = "candy"
                    candy.userData = ["stick": stick2]
                    scene.candies.append(candy)
                    scene.addChild(candy)
                }
            }
        }
    }
}
