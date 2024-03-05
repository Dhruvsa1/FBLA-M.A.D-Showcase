import SwiftUI

struct AcademicUserInfoView: View {
//    @State private var courses: [Course] = []
//    @State private var gpa = GPA()
   
    
    @StateObject var dropdownsManager = DropdownsManager()
    @Binding var page: String
    // StateObjects for each dropdown, with unique IDs and a shared manager.
    @StateObject var dropdown1: DropdownIndetifier
    @StateObject var dropdown2: DropdownIndetifier
    
    @StateObject private var viewModel = AcademicUserInfoViewModel() // Integrate the ViewModel
    
    
//    @State private var navigationPath = NavigationPath()
    
    private func saveUserInfoAndNavigate() {
        viewModel.saveAcademicInfo()
       
        withAnimation(.default){
            page = "home"
        }
//        navigationPath.append(HomeID())
        
    }
    // Custom initializer to set up dropdown view models with a shared manager.
    init(page: Binding<String>) {
        let manager = DropdownsManager()
        _dropdownsManager = StateObject(wrappedValue: manager)
        _dropdown1 = StateObject(wrappedValue: DropdownIndetifier(id: "dropdown7", manager: manager))
        _dropdown2 = StateObject(wrappedValue: DropdownIndetifier(id: "dropdown8", manager: manager))
        self._page = page
    }
    
    var body: some View {
//        NavigationStack(path: $navigationPath) {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Academic Information")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding([.bottom], 20)
                    
                    // Dynamically addable course list
                    UserInfoDropDownView(viewModel: dropdown1, label: "Courses") {
                        CourseListView(courses: $viewModel.courses)
                    }
                    
                    // GPA Input Section
                    UserInfoDropDownView(viewModel: dropdown2, label: "Stats") {
                        VStack(alignment: .leading, spacing: 10) {
                           
                            
                            TextField("Weighted GPA", value: $viewModel.gpa.weighted, format: .number)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                            
                            TextField("Unweighted GPA", value: $viewModel.gpa.unweighted, format: .number)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                            TextField("SAT", value: $viewModel.satact.SAT, format: .number)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                            
                            TextField("ACT", value: $viewModel.satact.ACT, format: .number)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    // Next button to navigate and save information
                    Button(action: {
                    
                        saveUserInfoAndNavigate()// Trigger saving to Firestore
                        
                         // Navigate to HomeView or trigger navigation
                    }) {
                        Text("Next")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.top, 30)
//            .navigationDestination(for: HomeID.self) { id in
//                HomeView() // The destination for HomeID
//            }

        }
    }
//}

// Ensure you have these models and view components properly defined elsewhere in your project
//struct HomeID: Hashable { }

struct AcademicUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        @State var page = "two"
        AcademicUserInfoView(page: $page)
    }
}
