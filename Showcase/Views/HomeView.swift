//
//  HomeView.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/5/24.
//

import FirebaseAuth
import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
   
    var body: some View {
     
        
        VStack {
            Spacer() // Pushes everything to the bottom
            
            // Your content views here
            ZStack {
                if selectedTab == 0 {
                    TweetsView()
                        .transition(.slide)
                } else if selectedTab == 1 {
                   ProfilePageView()
                        .transition(.slide)
                } else if selectedTab == 2 {
                    MemoriesUploadView()
                        .transition(.slide)
                } else if selectedTab == 3 {
                   DiscoverView()
                        .transition(.slide)
                } else if selectedTab == 4 {
                    SettingsPageView()
                        .transition(.slide)
                }
            }
           
            Spacer()
            
            // Custom Tab Bar
            HStack(spacing: 20) {
                Spacer()
                // Home Button
                Button{
                    
                    withAnimation(.default) {
                        selectedTab = 0
                    }
                } label: {
                    Image(systemName: "house")
                        .foregroundColor(selectedTab == 0 ? .yellow : .gray)
                }
                .padding( 20)
                
                
                // Profile Button
                Button{
                    withAnimation(.default) {
                        selectedTab = 1
                    }
                } label: {
                    Image(systemName: "person")
                        .foregroundColor(selectedTab == 1 ? .yellow : .gray)
                }
                
                
                // Center Button (larger button, you can overlay it on top of the TabView)
                Button{
                    withAnimation(.default) {
                        selectedTab = 2
                    }
                } label: {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .background(selectedTab == 2 ? Color.yellow : Color.black) // Or any other color
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                
                
                
                // Settings Button
                Button{
                    withAnimation(.default) {
                        selectedTab = 3
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(selectedTab == 3 ? .yellow : .gray)
                }
                
                // Awards Button
                Button{
                    
                    withAnimation(.default) {
                        selectedTab = 4
                    }
                } label: {
                    Image(systemName: "gear")
                        .foregroundColor(selectedTab == 4 ? .yellow : .gray)
                }
                .padding( 20)
                
                Spacer()
            }
            
            .frame(height: 100)
            .background(Color.black.opacity(0.95))
            .cornerRadius(30)
            .offset()
            
        }
        .ignoresSafeArea()
    }
    
  
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




// try Auth.auth().signOut()
