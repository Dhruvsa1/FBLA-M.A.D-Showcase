//
//  SelectedSportsView.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/1/24.
//

import SwiftUI
import WrappingHStack

struct AwardsAndAchievementsListView: View {
    @Binding var achievementAndAwards: [AchievementAndAward]
    
    var body: some View {
        ScrollView {
            
            ForEach($achievementAndAwards.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    TextField("Title", text: $achievementAndAwards[index].name)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .cornerRadius(5)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .autocapitalization(.none)

                    TextEditor(text: $achievementAndAwards[index].description)
                        .padding(4) // Adjust padding to your preference
                        .frame(minHeight: 60) // You can adjust this as needed
                        .background(Color.white)
                        .foregroundColor(.gray)
                        .cornerRadius(5)
                        .autocapitalization(.none)
                       
                        
                }
                .frame(width: 250, height: 200, alignment: .topLeading)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 2, y: 4)
                .overlay(
                    Button {
                        withAnimation {
                            self.removeAchievmentAndAward(at: index)
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                            .padding(5)
                    }
                    .offset(x: 15, y: -15),
                    alignment: .topTrailing
                )
                .padding(.trailing, 20)
                .padding([.top, .leading, .bottom])

            }
            .padding(.horizontal)
            
            Button(action: addAchievmentAndAward) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Achievement/Award")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.primary)
                .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func addAchievmentAndAward() {
        withAnimation(.default) {
            achievementAndAwards.append(AchievementAndAward(name: "", description: "Description"))
        }
    }
    
    func removeAchievmentAndAward(at index: Int) {
        achievementAndAwards.remove(at: index)
    }
}

// This preview will work only within a SwiftUI preview environment.
//struct ClubListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClubListView()
//    }
//}

struct CAwardsAndAchievementsListView_Previews: PreviewProvider {
    @State static var previewAchievmentsAndAwards: [AchievementAndAward] = [AchievementAndAward(name: "Sample Club", description: "Sample Description")]
    
    static var previews: some View {
        // Provide the binding to the previewClubs state variable
        AwardsAndAchievementsListView(achievementAndAwards: $previewAchievmentsAndAwards)
            .previewLayout(.sizeThatFits)
    }
}
