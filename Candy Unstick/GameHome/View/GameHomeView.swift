import SwiftUI

struct GameHomeView: View {
    
    @StateObject var userManager: UserManager = UserManager()
    
    @State var noLivesErrorVisible = false
    @State var goToGame = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: ShopeGameView(viewModel: ShopViewModel(userManager: userManager))
                        .environmentObject(userManager)
                        .navigationBarBackButtonHidden(true)) {
                            Image("shop_button")
                                .resizable()
                                .frame(width: 70, height: 70)
                        }
                    Spacer()
                    NavigationLink(destination: RulesGameView()
                        .navigationBarBackButtonHidden(true)) {
                            Image("rules_button")
                                .resizable()
                                .frame(width: 70, height: 70)
                        }
                    Spacer()
                    NavigationLink(destination: SettingsGameView()
                        .navigationBarBackButtonHidden(true)) {
                            Image("settings_button")
                                .resizable()
                                .frame(width: 70, height: 70)
                        }
                    Spacer()
                }
                .padding(.top, 32)
                
                HStack {
                    ZStack {
                        Image("lives_background")
                            .resizable()
                            .frame(width: 120, height: 80)
                        Text("\(userManager.user.lives)")
                            .font(.custom("SpicyRice-Regular", size: 32))
                            .foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                            .offset(x: 20)
                            .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
                    }
                    Spacer()
                    ZStack {
                        Image("coins_background")
                            .resizable()
                            .frame(width: 120, height: 53)
                        Text("\(userManager.user.coins)")
                            .font(.custom("SpicyRice-Regular", size: 32))
                            .foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                            .offset(x: 20)
                            .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
                    }
                }
                .padding()
                
                Spacer()
                
                Image("menu_icon")
                    .resizable()
                    .frame(width: 400, height: 450)
                
                
                Button {
                    if userManager.user.lives > 0 {
                        goToGame = true
                        userManager.restLives(rest: 1)
                    } else {
                        noLivesErrorVisible = true
                    }
                } label: {
                    Image("play_button")
                        .resizable()
                        .frame(width: 220, height: 75)
                }
                
                NavigationLink(destination: UnstickGameView()
                    .environmentObject(userManager)
                    .navigationBarBackButtonHidden(true), isActive: $goToGame) {
                        
                    }
                
                Spacer()
            }
            .background(
                Image("menu_background")
                    .resizable()
                    .frame(minWidth: UIScreen.main.bounds.width,
                           minHeight: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
            )
            .alert(isPresented: $noLivesErrorVisible) {
                Alert(title: Text("No lives"),
                message: Text("You need to buy lives to keep playing! Go to the store and buy lives"),
                      dismissButton: .cancel(Text("Ok")))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    GameHomeView()
}
