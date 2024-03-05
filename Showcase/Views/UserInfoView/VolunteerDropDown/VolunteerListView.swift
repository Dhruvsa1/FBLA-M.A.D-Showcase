import SwiftUI

struct VolunteerListView: View {
    @Binding var activities: [VolunteeringActivity]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                ForEach($activities.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        TextField("Title", text: $activities[index].title)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                            .background(Color.white)
                            .cornerRadius(5)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .autocapitalization(.none)

                        TextEditor(text: $activities[index].description)
                            .padding(.horizontal, 16)
                            .frame(minHeight: 60)
                            .background(Color.white)
                            .foregroundColor(.gray)
                            .cornerRadius(5)
                            .autocapitalization(.none)

                        HStack {
                            Text("Hours of Service: ")
                                .frame(width: 150)
                                .foregroundColor(.gray)
                            
                            TextField("0", text: $activities[index].hoursOfService)
                                .frame(width: 100)
                                .keyboardType(.numberPad)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(Color.white)
                        .cornerRadius(5)
                        .foregroundColor(.black)

                    }
                    .frame(width: 250, height: 250, alignment: .topLeading)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, y: 4)
                    .overlay(
                        Button {
                            withAnimation {
                                self.removeActivity(at: index)
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .background(Color.black)
                                .clipShape(Circle())
                                .padding(5)
                        }
                        .offset(x: 15, y: -15),
                        alignment: .topTrailing
                    )
                    .padding(.trailing, 20)
                    .padding([.top, .leading, .bottom])
                }
                .padding(.horizontal)
                
                
                    Button(action: addActivity) {
                        HStack {
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                            Text("Add Volunteering")
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.primary)
                        .cornerRadius(10)
                    }
                    .padding()
                }
            }
        }

    
    func addActivity() {
        withAnimation(.default) {
            activities.append(VolunteeringActivity(title: "", description: "Description", hoursOfService: ""))
        }
    }
    
    func removeActivity(at index: Int) {
        activities.remove(at: index)
    }
}

// Preview
struct VolunteerListView_Previews: PreviewProvider {
    @State static var previewActivities: [VolunteeringActivity] = [VolunteeringActivity(title: "Sample Title", description: "Sample Description", hoursOfService: "10")]

    static var previews: some View {
        VolunteerListView(activities: $previewActivities)
            .previewLayout(.sizeThatFits)
    }
}
