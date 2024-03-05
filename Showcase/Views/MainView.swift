//
//  MainView.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 2/4/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    @State var setUpPage = "one"
    
    
    
    var body: some View {
            VStack {
                if viewModel.isLoading {
                    ProgressView().scaleEffect(2.0, anchor: .center)
                } else if let user = viewModel.user, viewModel.isSignedIn {
                    if user.setUpDone {
                        HomeView().transition(.slide)
                    } else {
                        switch setUpPage {
                        case "one":
                            NavigationStack {
                                UserInfoView(page: $setUpPage).transition(.slide)
                            }
                        case "two":
                            AcademicUserInfoView(page: $setUpPage).transition(.slide)
                        case "home":
                            HomeView().transition(.slide)
                        default:
                            Text("Unknown setup page")
                        }
                    }
                } else {
                    InitialView()
                }
            }
        }
    }







#Preview {
    MainView()
}
