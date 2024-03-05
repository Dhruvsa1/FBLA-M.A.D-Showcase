import Foundation
import SwiftUI
import WrappingHStack

struct UserInfoView: View {
    
    @State  var userAthletics = Athletic(id: nil, sports: [], isCaptain: false)
    
    let sports = ["Soccer", "Basketball", "Tennis", "Baseball", "Volleyball"]
    
    @StateObject var viewModel = UserInfoViewModel()
    
    @Binding var page: String
//    
//    @State private var navigationPath = NavigationPath()
    
    // StateObject to manage the state of dropdowns across the app.
    @StateObject var dropdownsManager = DropdownsManager()
    
    // StateObjects for each dropdown, with unique IDs and a shared manager.
    @StateObject var dropdown1: DropdownIndetifier
    @StateObject var dropdown2: DropdownIndetifier
    @StateObject var dropdown3: DropdownIndetifier
    @StateObject var dropdown4: DropdownIndetifier
    @StateObject var dropdown5: DropdownIndetifier
    
    // Custom initializer to set up dropdown view models with a shared manager.
    init(page: Binding<String>) {
        let manager = DropdownsManager()
        _dropdownsManager = StateObject(wrappedValue: manager)
        _dropdown1 = StateObject(wrappedValue: DropdownIndetifier(id: "dropdown1", manager: manager))
        _dropdown2 = StateObject(wrappedValue: DropdownIndetifier(id: "dropdown2", manager: manager))
        _dropdown3 = StateObject(wrappedValue: DropdownIndetifier(id: "dropdown3", manager: manager))
        _dropdown4 = StateObject(wrappedValue: DropdownIndetifier(id: "dropdown4", manager: manager))
        _dropdown5 = StateObject(wrappedValue: DropdownIndetifier(id: "dropdown5", manager: manager))
        self._page = page
    }
    
    private func saveUserInfoAndNavigate() {
        viewModel.saveUserInfo()
        withAnimation(.default){
            page = "two"
        }
//        navigationPath.append(AcademicUserInfoViewID())
        
    }
    
    
    // SwiftUI view content.
    var body: some View {
//        NavigationStack(path: $navigationPath) {
            ScrollView {
                VStack (alignment: .leading, spacing: 20){
                    Text("Extracurriculars").font(.largeTitle).fontWeight(.bold).padding([.bottom], 50)
                    
                    UserInfoDropDownView(viewModel: dropdown1, label: "Athletics") {
                        VStack(spacing: 10) {
                            SelectSportView(sports: sports, selectedSports: $viewModel.selectedSports)
                            SelectedSportsView(selectedSports: $viewModel.selectedSports)
                            if (!viewModel.selectedSports.isEmpty) {
                                IsCaptainView(isCaptain: $viewModel.isCaptain)
                                
                            }
                        }
                        
                    }
                    UserInfoDropDownView(viewModel: dropdown2, label: "Clubs") {
                        ClubListView(clubs: $viewModel.clubs)
                    }
                    
                    UserInfoDropDownView(viewModel: dropdown3, label: "Volunteering") {
                        VolunteerListView(activities: $viewModel.activities)
                    }
                    
                    UserInfoDropDownView(viewModel: dropdown4, label: "Awards and Achievements") {
                        AwardsAndAchievementsListView(achievementAndAwards: $viewModel.achievementsAndAwards)
                    }
                    UserInfoDropDownView(viewModel: dropdown5, label: "Experiences") {
                        ExperienceListView(experiences: $viewModel.experiences)
                    }
                }
                
                
                Spacer()
                
                
                
            }.padding([.top], 30)
            
            
            
            Button {
                saveUserInfoAndNavigate()
            } label:  {
                Text("Next")
                    .frame(width: 300, height: 50)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
        }
//        .navigationDestination(for: AcademicUserInfoViewID.self) { id in
//            AcademicUserInfoView()
//            
//        }
//       

        
        
        
//    }
    
}

//struct AcademicUserInfoViewID: Hashable { }



struct UserInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        @State var page = "one"
        NavigationStack {
            UserInfoView(page: $page)
        }
    }
}
