////
////  ContentView.swift
////  Showcase
////
////  Created by Dhruvsai Dhulipudi on 1/28/24.
////
//
//import SwiftUI
//import SwiftData
//
//struct ContentView: View {
//    @State private var isNight = false
//    
//   
//    var body: some View {
//        ZStack {
//            BackgroundView(isNight: isNight)
//            VStack {
//                City(name: "Cupertino, CA")
//                DayFocus(image: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 58)
//                HStack(spacing: 20) {
//                    SmallDayView(day: "TUE", temp: 58, image: "cloud.sun.fill")
//                    SmallDayView(day: "TUE", temp: 58, image: "cloud.sun.fill")
//                    SmallDayView(day: "TUE", temp: 58, image: "cloud.sun.fill")
//                    SmallDayView(day: "TUE", temp: 58, image: "cloud.sun.fill")
//                    SmallDayView(day: "TUE", temp: 58, image: "cloud.sun.fill")
//                }
//                Spacer()
//                Button {
//                    isNight.toggle()
//                } label: {
//                    WeatherButton(label: "Dark mode", textColor: .blue, bgColor: .white)
//                    
//                }
//                Spacer()
//               
//            }
//            
//            
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
//struct SmallDayView: View {
//    var day: String
//    var temp: Int
//    var image: String
//    
//    var body: some View {
//        VStack {
//            Text(day)
//                .font(.system(size: 16, weight: .medium, design: .default))
//                .foregroundColor(.white)
//            Image(systemName: image)
//                .symbolRenderingMode(.palette)
//                .resizable()
//                .foregroundStyle(.white, .orange, .green)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 40, height: 40)
//            Text("\(temp)°")
//                .font(.system(size: 28, weight: .medium, design: .default))
//                .foregroundColor(.white)
//        }
//    }
//}
//
//struct BackgroundView: View {
//    var isNight: Bool
//    
//    var body: some View {
////        LinearGradient(gradient: [.blue, Color("lightBlue")], startPoint: .top, endPoint: .bottomTrailing)
//       ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient    : Color.blue.gradient)
//            .ignoresSafeArea()
//    }
//}
//
//struct City: View {
//    var name: String
//    var body: some View {
//        Text(name)
//            .font(.system(size: 32, weight: .medium, design: .default))
//            .foregroundColor(.white)
//            .padding()
//    }
//}
//
//struct DayFocus: View {
//
//    var image: String
//    var temp: Int
//    
//    var body: some View {
//        VStack(spacing: 10) {
//            Image(systemName: image)
//                .renderingMode(.original)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 180, height: 180)
//            Text("\(temp)°")
//                .font(.system(size: 70, weight: .medium, design: .default))
//                .foregroundColor(.white)
//            
//        }
//        .padding(.bottom, 50)
//    }
//}
//
//struct WeatherButton: View {
//    var label: String
//    var textColor: Color
//    var bgColor: Color
//    
//    var body: some View {
//        Text(label)
//            .frame(width: 280, height: 50)
//            .background(bgColor.gradient)
//            .foregroundColor(textColor)
//            .font(.system(size: 20, weight: .bold, design: .default))
//            .cornerRadius(10)
//    }
//}
