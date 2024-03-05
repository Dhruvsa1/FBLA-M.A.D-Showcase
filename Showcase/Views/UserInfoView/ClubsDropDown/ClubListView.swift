//
//  SelectedSportsView.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/1/24.
//

import SwiftUI
import WrappingHStack

struct ClubListView: View {
    @Binding var clubs: [Club]
    
    var body: some View {
        ScrollView {
            
            ForEach($clubs.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    TextField("Title", text: $clubs[index].name)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .cornerRadius(5)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .autocapitalization(.none)

                    TextEditor(text: $clubs[index].description)
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
                            self.removeClub(at: index)
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
            
            Button(action: addClub) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Club")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.primary)
                .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func addClub() {
        withAnimation(.default) {
            clubs.append(Club(name: "", description: "Description"))
        }
    }
    
    func removeClub(at index: Int) {
        clubs.remove(at: index)
    }
}

// This preview will work only within a SwiftUI preview environment.
//struct ClubListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClubListView()
//    }
//}

struct ClubListView_Previews: PreviewProvider {
    @State static var previewClubs: [Club] = [Club(name: "Sample Club", description: "Sample Description")]
    
    static var previews: some View {
        // Provide the binding to the previewClubs state variable
        ClubListView(clubs: $previewClubs)
            .previewLayout(.sizeThatFits)
    }
}
