import Foundation
import SwiftUI
import Combine

class DropdownIndetifier: ObservableObject {
   
    
    var id: String
    var manager: DropdownsManager
    private var cancellables = Set<AnyCancellable>()

    // Published property to represent if this dropdown is expanded.
    @Published var isExpanded: Bool = false

    // Initializer sets up the view model with a unique ID and a reference to the manager.
    init(id: String, manager: DropdownsManager) {
        self.id = id
        self.manager = manager

        // Observes changes in the manager's expandedDropdownID and updates isExpanded.
        manager.$expandedDropdownID
            .map { $0 == id } // Map to true if this dropdown should be expanded.
            .assign(to: \.isExpanded, on: self)
            .store(in: &cancellables)
    }

    // Toggles the expanded state of the dropdown.
    func toggle() {
        withAnimation {
            manager.toggleDropdown(withID: id)
        }
    }
}
