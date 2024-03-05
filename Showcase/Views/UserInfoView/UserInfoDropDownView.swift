//
//  UserInfoDropDownView.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/1/24.
//

import SwiftUI

/// 
struct UserInfoDropDownView<Content: View>: View {
    @ObservedObject var viewModel: DropdownIndetifier
    let label: String
    let content: () -> Content
    
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                Text(label).padding(20)
                Spacer()
                Image(systemName: "chevron.down.circle.fill").rotationEffect(.degrees(viewModel.isExpanded ? 180 : 0)).font(.title2).padding(20).onTapGesture {
                    withAnimation {
                        viewModel.toggle()
                    }
                }
            }
            if viewModel.isExpanded {
                content().transition(.scale).padding(20)
            }
        }
        .frame(width: 350, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 2, y: 4)
        .foregroundStyle(.black)
    }
    
    // Custom initializer for the dropdown view.
    init(viewModel: DropdownIndetifier, label: String, @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.label = label
        self.content = content
    }
}

//#Preview {
//    UserInfoDropDownView()
//}
