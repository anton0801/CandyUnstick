import SwiftUI

struct SettingsGameView: View {
    
    @Environment(\.presentationMode) var back
    
    @State var soundButtonState = UserDefaults.standard.bool(forKey: "sound_on") {
        didSet {
            UserDefaults.standard.set(soundButtonState, forKey: "sound_on")
        }
    }
    
    @State var vibrationsState = UserDefaults.standard.bool(forKey: "vibrationsState") {
        didSet {
            UserDefaults.standard.set(vibrationsState, forKey: "vibrationsState")
        }
    }
    
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
                Text("SETTINGS")
                    .font(.custom("SpicyRice-Regular", size: 52)).foregroundColor(Color.init(red: 245/255, green: 220/255, blue: 75/255))
                    .shadow(color: Color.init(red: 209/255, green: 31/255, blue: 18/255), radius: 1)
            }
            .padding(.top, 62)
            Spacer()
            HStack {
                Spacer()
                
                if soundButtonState {
                    Button {
                        withAnimation {
                            soundButtonState = false
                        }
                    } label: {
                        Image("sound_b")
                            .resizable()
                            .frame(width: 120, height: 180)
                    }
                } else {
                    Button {
                        withAnimation {
                            soundButtonState = true
                        }
                    } label: {
                        Image("sound_off_b")
                            .resizable()
                            .frame(width: 120, height: 180)
                    }
                }
                
                Spacer()
                
                if vibrationsState {
                    Button {
                        withAnimation {
                            vibrationsState = false
                        }
                    } label: {
                        Image("vibration_on")
                            .resizable()
                            .frame(width: 180, height: 180)
                    }
                } else {
                    Button {
                        withAnimation {
                            vibrationsState = true
                        }
                    } label: {
                        Image("vibration_off")
                            .resizable()
                            .frame(width: 180, height: 180)
                    }
                }
                Spacer()
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
    }
}

#Preview {
    SettingsGameView()
}
