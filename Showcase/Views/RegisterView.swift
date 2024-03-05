import SwiftUI

/// `RegisterView` serves as the user interface for the registration process within the app. It utilizes `RegisterViewModel` to manage user input and registration logic.
struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel() // ViewModel that handles the registration logic.
    
    var body: some View {
        // Checks if registration was successful to decide between showing the registration form or transitioning to the login view.
        if !viewModel.success {
            ZStack{
                NavigationView {
                    VStack{
                        Spacer()
                        // Form for user input.
                        Form {
                            // Section for personal information inputs.
                            Section(header: Text("Personal")) {
                                TextField("First Name", text: $viewModel.fname)
                                    .foregroundColor(.primary)
                                TextField("Last Name", text: $viewModel.lname)
                                    .foregroundColor(.primary)
                                TextField("Email", text: $viewModel.email)
                                    .foregroundColor(.primary)
                                TextField("Phone Number", text: $viewModel.phoneNumber)
                                    .foregroundColor(.primary)
                                TextField("Address", text: $viewModel.address)
                                    .foregroundColor(.primary)
                                DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            
                            Spacer()
                            
                            // Section for profile information inputs.
                            Section(header: Text("Profile")) {
                                TextField("Username", text: $viewModel.username)
                                    .foregroundColor(.primary)
                                SecureField("Password", text: $viewModel.password)
                                    .foregroundColor(.primary)
                                
                                // Button to trigger the registration process.
                                HStack{
                                    Spacer()
                                    VStack{
                                        Button {
                                            viewModel.register()
                                        } label: {
                                            Text("Create Account")
                                                .frame(width: 170, height: 60)
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
                    .navigationTitle("Create an Account")
                    .padding(.top, 20)
                    .foregroundColor(Color("light_black"))
                }
            }
            // Alert for displaying error messages.
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text(viewModel.errorMessage))
            })
        } else {
            // Navigates to the LoginView upon successful registration.
            LoginView()
        }
    }
}

// Preview provider for SwiftUI previews in Xcode.
#if DEBUG
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
#endif
