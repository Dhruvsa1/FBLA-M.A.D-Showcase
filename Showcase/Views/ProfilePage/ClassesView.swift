import SwiftUI

struct ClassesView: View {
    @State private var selectedTab = "Core"

    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Classes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
                .padding(.leading, 20)

            // Tab View
            Picker("Choose your category", selection: $selectedTab) {
                Text("Core").tag("Core")
                Text("Electives").tag("Electives")
            }
            .frame(width: 200)
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // Cards for classes
            ScrollView {
                VStack(spacing: 20) {
                    if selectedTab == "Core" {
                        ForEach(["Math", "Literature", "Science"], id: \.self) { subject in
                            ClassCard(subject: subject, classes: ["AP Calc BC", "AP Pre-calc", "Honors Math", "Algebra I"])
                        }
                    } else {
                        ForEach(["Computer Science", "Engineering"], id: \.self) { subject in
                            ClassCard(subject: subject, classes: ["Intro. to Digital Tech.", "AP CSP", "AP CSA", "Engineering"])
                        }
                    }
                    
                }
                .padding()
            }
        }
        .padding(.leading, 15)
    }
}

struct ClassCard: View {
    var subject: String
    var classes: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(subject)
                .font(.headline)
                .padding(.bottom, 2)

            Text(classes.joined(separator: ", "))
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 300)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesView()
    }
}
