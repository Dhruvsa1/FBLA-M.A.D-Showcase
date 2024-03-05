import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .top, endPoint: .bottom)
                .frame(height: 160) // Adjust this value as needed
                .edgesIgnoringSafeArea(.all) // This ensures the gradient goes all the way to the top

            VStack(alignment: .leading, spacing: 8) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, -15) // Negative padding to pull the image up so it aligns with the gradient's bottom edge
                    .background(Color.white) // Ensure the background is clear
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Dhruvsai Dhulipudi")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .background(Color.white) // Apply background to Text only

                    Text("11th grader")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .background(Color.white) // Apply background to Text only

                    Text("I am a junior in Lambert High School. I love the environment! Some other things about me are I have great friends named Sarvajith, Avaneesh, and Pranav. With all these people surrounding me, I am successful. ")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .background(Color.white) // Apply background to Text only
                }
            }
            .padding(.horizontal, 20)
            .offset(y: -50) // Adjust the y offset to move the contents up to match the design
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
