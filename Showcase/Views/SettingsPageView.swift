import SwiftUI
import FirebaseAuth

struct SettingsPageView: View {
    // URLs for your documents
    let privacyPolicyURL = URL(string: "https://docs.google.com/document/d/1pZK1cEz4Ny9jeQGbZqYehFESYLbhO3gmyRNaBTtc_hY/edit?usp=sharing")!
    let termsConditionsURL = URL(string: "https://docs.google.com/document/d/1pZK1cEz4Ny9jeQGbZqYehFESYLbhO3gmyRNaBTtc_hY/edit?usp=sharing")!
    let copyrightComplianceURL = URL(string: "https://docs.google.com/document/d/1pZK1cEz4Ny9jeQGbZqYehFESYLbhO3gmyRNaBTtc_hY/edit?usp=sharing")!
    let documentationURL = URL(string: "https://aquatic-era-c06.notion.site/Documentation-0916f286d29b4e659ccb2568e8e0da22?pvs=4")!
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    
                    Button {
                        openURL(url: privacyPolicyURL)
                    } label: {
                        SettingsButtonLabel(text: "Privacy Policy", topPadding: 200)
                    }

                    Button {
                        openURL(url: termsConditionsURL)
                    } label: {
                        SettingsButtonLabel(text: "Terms and Conditions", topPadding: 20)
                    }

                    Button {
                        openURL(url: copyrightComplianceURL)
                    } label: {
                        SettingsButtonLabel(text: "Copyright Compliance", topPadding: 20)
                    }
                    Button {
                        openURL(url: documentationURL)
                    } label: {
                        SettingsButtonLabel(text: "Documentation", topPadding: 20)
                    }
                    NavigationLink(destination: PortfolioEditView()) {
                                          SettingsButtonLabel(text: "Edit/Update Portfolio", topPadding: 20)
                                      }
                    

                    Spacer()
                    
                    LogoutButton()
                    
                    Spacer()
                    
                }
                .navigationTitle("Settings")
                .background(Color.white)
                .padding()
                .accentColor(.red)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
    
    func openURL(url: URL) {
        UIApplication.shared.open(url)
    }
}

struct SettingsButtonLabel: View {
    var text: String
    var topPadding: CGFloat
    
    var body: some View {
        Text(text)
            .frame(width: 250, height: 55)
            .background(Color.white)
            .cornerRadius(12)
            .font(.system(size: 20, weight: .regular))
            .foregroundColor(.black)
            .padding(.top, topPadding)
            .shadow(radius: 2)
    }
}

struct LogoutButton: View {
    var body: some View {
        Button {
            do {
                try Auth.auth().signOut()
            } catch {
                print(error.localizedDescription)
            }
        } label: {
            Text("Logout")
                .frame(width: 140, height: 50)
                .background(Color("light_black"))
                .cornerRadius(30)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 50)
        }
    }
}

struct SettingsPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPageView()
    }
}
