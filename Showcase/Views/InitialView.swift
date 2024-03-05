
import SwiftUI

struct InitialView: View {
    let gradient = Gradient(colors: [.black, Color("dark_black"), Color("light_black"),Color("dark_black"), .black, Color("light_black")])
    
    var body: some View {
        
        NavigationView{
            ZStack{

                LinearGradient(gradient: gradient,      startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                VStack() {
                    Spacer()
                    VStack(spacing: 10){
                       Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                        Text("Showcase")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.white)
                            
                    }
            
                    VStack(spacing: 30){
                        NavigationLink("Log in", destination: LoginView())
                            .frame(width:140, height: 50)
                                .background(.white)
                                .cornerRadius(30)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(Color("dark_black"))
                                .padding(.top, 50)
                        NavigationLink("Sign Up", destination: RegisterView() .navigationBarBackButtonHidden(true))
                            .frame(width:140, height: 50)
                            .background(.black)
                            .cornerRadius(30)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.white, lineWidth: 2))
                        
                        }
                   
                        
                        Spacer()
                    }
                   
                }
            }
        
        }
       
        
    }
    

#Preview {
    InitialView()
}
