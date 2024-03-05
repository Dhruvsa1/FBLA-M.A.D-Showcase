//
//  IsCaptainView.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/1/24.
//

import SwiftUI

struct IsCaptainView: View {
    @Binding var isCaptain: String
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Were you captain of your sport(s) team(s)?")
                Spacer()
            }
            HStack {
                HStack {
                    Button {
                       isCaptain = "yes"
                    } label: {
                        Circle()
                            .stroke(Color.black, lineWidth: 1)
                            .background(isCaptain == "yes" ? Circle().fill(Color.black) : Circle().fill(Color.white))
                            .frame(width: 15, height: 15)
                    }
                        
                        
                    Text("Yes")
                        .font(.caption)
                    
                    
                }
                HStack {
                    Button {
                        isCaptain = "no"
                    } label: {
                        Circle()
                            .stroke(Color.black, lineWidth: 1)
                            .background(isCaptain == "no" ? Circle().fill(Color.black) : Circle().fill(Color.white))
                            .frame(width: 15, height: 15)
                    }
                        
                        
                    Text("No")
                        .font(.caption)
                    
                    
                }
                Spacer()
                
            }
        }
    }
}

//#Preview {
//    IsCaptainView()
//}
