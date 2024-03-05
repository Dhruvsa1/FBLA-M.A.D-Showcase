import SwiftUI
import FirebaseFirestoreSwift

struct DiscoverView: View {
   let users: [User] = [
    User(
        id: "1",
        fname: "Dhruvsai",
        lname: "Dhulipudi",
        username: "Dhruvsa1",
        password: "password123",
        email: "alice.johnson@example.com",
        phoneNumber: "555-0100",
        address: "123 Maple Street",
        setUpDone: true,
        birthday: Date()
    ),
    User(
        id: "2",
        fname: "Bob",
        lname: "Smith",
        username: "bobsmith",
        password: "password456",
        email: "bob.smith@example.com",
        phoneNumber: "555-0200",
        address: "456 Oak Avenue",
        setUpDone: true,
        birthday: Date()
    ),
    User(
        id: "3",
        fname: "Carol",
        lname: "Williams",
        username: "carolw",
        password: "password789",
        email: "carol.williams@example.com",
        phoneNumber: "555-0300",
        address: "789 Pine Road",
        setUpDone: true,
        birthday: Date()
    )
    // Add more mock users as needed
]
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: ProfilePageView()) {
                    HStack {
                        Text(user.fname + " " + user.lname)
                            .bold()
                        Spacer()
                        Text("@\(user.username)")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Discover")
            
        }
    }
}



// Preview Provider
struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
