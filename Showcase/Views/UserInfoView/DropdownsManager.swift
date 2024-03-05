import Foundation

class DropdownsManager: ObservableObject {
    // Published property to track the ID of the expanded dropdown.
    @Published var expandedDropdownID: String?

    // Function to toggle the expanded state of a dropdown.
    func toggleDropdown(withID id: String) {
        if expandedDropdownID == id {
            expandedDropdownID = nil
        } else {
            expandedDropdownID = id
        }
    }
}
