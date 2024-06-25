import SwiftUI

struct RulesGameView: View {
    
    @Environment(\.presentationMode) var back
    
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
                Text("RULES")
                    .font(.custom("SpicyRice-Regular", size: 52)).foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                    .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
            }
            .padding(.top, 62)
            Spacer()
            Text("Click on the lollipops and insert them into the empty holes until the caramel drops.")
                .font(.custom("SpicyRice-Regular", size: 36)).foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
                .multilineTextAlignment(.center)
                .padding(.bottom, 62)
            Spacer()
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
    RulesGameView()
}
