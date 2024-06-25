import SwiftUI

struct ShopeGameView: View {
    
    @Environment(\.presentationMode) var back
    
    @EnvironmentObject var userManager: UserManager
    @StateObject var viewModel: ShopViewModel
    
    @State var errorLabel = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    back.wrappedValue.dismiss()
                } label: {
                    Image("home_button")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                Text("SHOP")
                    .font(.custom("SpicyRice-Regular", size: 52)).foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                    .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
            }
            .padding(.top, 62)
            
            ForEach(viewModel.currentItems, id: \.id) { shopItem in
                if shopItem.type == .lives {
                    HStack {
                        ZStack {
                            Image("lives_background")
                                .resizable()
                                .frame(width: 140, height: 100)
                            Text("+\(shopItem.count)")
                                .font(.custom("SpicyRice-Regular", size: 28)).foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                                .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
                                .offset(x: 30)
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Button {
                                errorLabel = !viewModel.purchase(item: shopItem)
                            } label: {
                                ZStack {
                                    Image("buy_button")
                                        .resizable()
                                        .frame(width: 190, height: 80)
                                    Image("coins_background")
                                        .resizable()
                                        .frame(width: 110, height: 60)
                                        .offset(x: -70)
                                    Text("\(shopItem.price)")
                                        .font(.custom("SpicyRice-Regular", size: 18))
                                        .offset(x: -45)
                                        .foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                                        .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
                                }
                            }
                        }
                    }
                    .padding([.leading, .trailing], 6)
                } else {
                    HStack {
                        ZStack {
                            Image(shopItem.item)
                                .resizable()
                                .frame(width: 140, height: 100)
                        }
                        
                        Spacer()
                        
                        if shopItem.price == 0 {
                            Text("Selected")
                                .font(.custom("SpicyRice-Regular", size: 32))
                                .offset(x: -45)
                                .foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                                .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 3)
                        } else {
                            ZStack {
                                Button {
                                    errorLabel = !viewModel.purchase(item: shopItem)
                                } label: {
                                    ZStack {
                                        Image("buy_button")
                                            .resizable()
                                            .frame(width: 190, height: 80)
                                        Image("coins_background")
                                            .resizable()
                                            .frame(width: 110, height: 60)
                                            .offset(x: -70)
                                        Text("\(shopItem.price)")
                                            .font(.custom("SpicyRice-Regular", size: 15))
                                            .offset(x: -45)
                                            .foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                                            .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 3)
                                    }
                                }
                            }
                        }
                    }
                    .padding([.leading, .trailing], 6)
                }
            }
            
            Spacer()
            
            HStack {
                Button {
                    viewModel.filterItems(by: .lives)
                } label: {
                    Image("arrow_left")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                .padding(.trailing, 24)
                
                if viewModel.currentItems[0].type == .lives {
                    Text("1/2")
                        .font(.custom("SpicyRice-Regular", size: 52)).foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                        .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 4)
                } else {
                    Text("2/2")
                        .font(.custom("SpicyRice-Regular", size: 52)).foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                        .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 4)
                }
                
                Button {
                    viewModel.filterItems(by: .sticks)
                } label: {
                    Image("arrow_right")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                .padding(.leading, 24)
            }
        }
        .alert(isPresented: $errorLabel) {
            Alert(
                title: Text("Purchase error"),
                message: Text("Failed to purchase this item! You do not have enough coins for the purchase."),
                dismissButton: .cancel(Text("Ok"))
            )
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
    ShopeGameView(viewModel: ShopViewModel(userManager: UserManager()))
        .environmentObject(UserManager())
}
