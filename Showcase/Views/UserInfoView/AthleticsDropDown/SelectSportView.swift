//
//  SelectSportView.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/1/24.
//

import SwiftUI

struct SelectSportView: View {
    var sports: [String]
    @Binding var selectedSports: Set<String>
    
    var body: some View {
        Menu {
            ForEach(sports, id: \.self) { sport in
                Button{
                    withAnimation(.default){
                        if selectedSports.contains(sport) {
                            selectedSports.remove(sport)
                        } else {
                            selectedSports.insert(sport)
                        }
                        
                    }
                } label: {
                    Label(sport, systemImage: selectedSports.contains(sport) ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(.gray)
                    
                }
                
                
                
            }
        } label: {
            HStack {
                Label("Select Sports", systemImage: "sportscourt")
                    .padding()
                    .foregroundColor(.gray)
                Spacer()
            }
          
          
            
        }
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.black, lineWidth: 1)
        )
        .cornerRadius(10)
        .padding([.top], -40)
       
      
    }
}

//#Preview {
//    SelectSportView()
//}
