import Foundation
import SwiftUI


class NavigationController: ObservableObject {
    @Published var navigationPath: NavigationPath = NavigationPath()
}
