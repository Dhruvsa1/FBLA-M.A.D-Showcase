import SwiftUI

struct ProfilePageView: View {
    var body: some View {
       ScrollView {
           VStack {
               ProfileHeaderView()
                MemoryView()
               StatsView()
               ClassesView()
               ExperiencesView()
           }.edgesIgnoringSafeArea(.all)
       }.edgesIgnoringSafeArea(.all) 
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
