

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
   
    var body: some View {
        
        ZStack{
            NavigationView {
                VStack{
                    Spacer()
                    Form {
                        Section(header: Text("Profile")){
                            TextField("email", text: $viewModel.email)
                                .foregroundColor(.primary)
                            SecureField("Password", text: $viewModel.password)
                                .foregroundColor(.primary)
                            
                            
                            HStack{
                                Spacer()
                                VStack{
                                    Button {
                                        viewModel.login { success in
                                            if success {
                                               
                                            }
                                        }
                                    } label: {
                                        Text("Login")
                                            .frame(width:140, height: 50)
                                            .background(Color("light_black"))
                                            .cornerRadius(30)
                                            .font(.system(size: 15, weight: .bold))
                                            .foregroundColor(.white)
                                            .padding(.top, 50)
                                    }
                                   
                                   
                                }
                                
                              
                                
                                Spacer()
                                
                            }
                            
                        }
                        .padding()
                        
                        
                        
                    }
                    .accentColor(.red)
                    .edgesIgnoringSafeArea(.all)
                    .scrollContentBackground(.hidden)
                    
                    
                    
                    
                }
                .navigationTitle("Log In")
                .padding(.top, 20)
                .foregroundColor(Color("light_black"))
                
            }
            
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

