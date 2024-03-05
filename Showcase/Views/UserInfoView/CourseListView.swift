import SwiftUI

struct CourseListView: View {
    @Binding var courses: [Course]
    
    // Subjects list for dropdown
    let subjects = ["Math", "History", "Science", "English", "Art", "Computer Science", "Music", "Theater", "Economics", "Psychology"]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach($courses.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Course Name", text: $courses[index].name)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            .foregroundColor(.black)
                        
                        // Dropdown for selecting the subject
                        Picker("Select Subject", selection: $courses[index].subject) {
                            ForEach(subjects, id: \.self) { subject in
                                Text(subject).tag(subject)
                            }
                        }
                        .foregroundStyle(.black)
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        
                        // Toggle for elective
                        Toggle(isOn: $courses[index].isElective) {
                            Text("Elective")
                        }
                        .padding()
                    }
                    .frame(width: 250, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, y: 2)
                    .overlay(
                        Button(action: { withAnimation { self.removeCourse(at: index) } }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                                .padding(10)
                        }
                        .offset(x: 10, y: -10),
                        alignment: .topTrailing
                    )
                    .padding(.bottom, 5)
                }
                
                Button(action: addCourse) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Course")
                    }
                    
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                }
                .padding(.top, 5)
            }
            .padding(.horizontal)
        }
    }
    
    func addCourse() {
        withAnimation {
            courses.append(Course(name: "", subject: subjects.first ?? "Math", isElective: false))
        }
    }
    
    func removeCourse(at index: Int) {
        withAnimation(.default) {
            courses.remove(at: index)
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    @State static var previewCourses: [Course] = []

    static var previews: some View {
        CourseListView(courses: $previewCourses)
    }
}
