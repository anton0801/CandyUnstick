import SwiftUI
import SpriteKit

struct UnstickGameView: View {
    
    @Environment(\.presentationMode) var backMode
    @EnvironmentObject var userManager: UserManager
    
    @State private var scene = CandiesUnstickGameScene()
    @State private var sceneState = "game"
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .ignoresSafeArea()
            
            switch (sceneState) {
            case "timeout":
                loseScreen
            case "gameCandiesDroppedAll":
                winScreen
            default:
                EmptyView()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .gameCandiesDroppedAll), perform: { _ in
            userManager.addCoins(add: 250)
            withAnimation(.linear) {
                sceneState = "gameCandiesDroppedAll"
            }
        })
        .onReceive(NotificationCenter.default.publisher(for: .timeout), perform: { _ in
            withAnimation(.linear) {
                sceneState = "timeout"
            }
        })
        .onReceive(NotificationCenter.default.publisher(for: .restart), perform: { _ in
            restartScene()
        })
        .onReceive(NotificationCenter.default.publisher(for: .toHome), perform: { _ in
            backMode.wrappedValue.dismiss()
        })
    }
    
    private func restartScene() {
        scene = scene.restart()
        withAnimation(.linear) {
            sceneState = "game"
        }
    }
    
    private var winScreen: some View {
        VStack {
            Image("level_done")
                .resizable()
                .frame(width: 350, height: 400)
            
            ZStack {
                Image("coins_background")
                    .resizable()
                    .frame(width: 120, height: 53)
                Text("+\(250)")
                    .font(.custom("SpicyRice-Regular", size: 20))
                    .foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                    .offset(x: 25)
                    .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
            }
            
            Spacer()
            
            HStack {
                Button {
                    backMode.wrappedValue.dismiss()
                } label: {
                    Image("home_b")
                        .resizable()
                        .frame(width: 80, height: 110)
                }
                
                Spacer().frame(width: 32)
                
                Button {
                    NotificationCenter.default.post(name: .restart, object: nil)
                } label: {
                    Image("restart_b")
                        .resizable()
                        .frame(width: 100, height: 110)
                }
            }
        }
        .background(
            Image("menu_background")
                .resizable()
                .frame(minWidth: UIScreen.main.bounds.width,
                       minHeight: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        )
    }
    
    private var loseScreen: some View {
        VStack {
            Text("GAME OVER")
                .font(.custom("SpicyRice-Regular", size: 42))
                .foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 3)
            
            ZStack {
                Image("lives_background")
                    .resizable()
                    .frame(width: 120, height: 80)
                Text("-1")
                    .font(.custom("SpicyRice-Regular", size: 24))
                    .foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                    .offset(x: 25)
                    .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 3)
            }
            
            HStack {
                Button {
                    backMode.wrappedValue.dismiss()
                } label: {
                    Image("home_b")
                        .resizable()
                        .frame(width: 80, height: 110)
                }
                
                Spacer().frame(width: 32)
                
                Button {
                    NotificationCenter.default.post(name: .restart, object: nil)
                } label: {
                    Image("restart_b")
                        .resizable()
                        .frame(width: 100, height: 110)
                }
            }
        }
        .background(
            Image("menu_background")
                .resizable()
                .frame(minWidth: UIScreen.main.bounds.width,
                       minHeight: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        )
    }
    
}

#Preview {
    UnstickGameView()
        .environmentObject(UserManager())
}
