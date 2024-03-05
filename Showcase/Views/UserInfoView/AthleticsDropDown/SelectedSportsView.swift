//
//  SelectedSportsView.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/1/24.
//

import SwiftUI
import WrappingHStack

struct SelectedSportsView: View {
    @Binding var selectedSports: Set<String>
    
    
    var body: some View {
        WrappingHStack(alignment: .leading,
                       horizontalSpacing: 10,
                       verticalSpacing: 10,
                       fitContentWidth: false) {
            ForEach(selectedSports.sorted(), id: \.self) { sport in
                Text(sport)
                    .padding(10)
                    .font(.system(size: 15))
                    .background(.black)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .transition(.scale)
            }
            
            
        }
    }
}

//#Preview {
//    SelectedSportsView()
//}
