//  Created by Axel Ancona Esselmann on 6/24/24.
//

import SwiftUI
import Ansi256Color

class ContentViewModel: ObservableObject {

    @Published
    var pickedColor: Color = .blue

    var pickedAnsiColor: Ansi256Color {
        guard let components = NSColor(pickedColor).cgColor.components else {
            return .blue
        }
        return Ansi256Color(
            red: Double(components[0]),
            green: Double(components[1]),
            blue: Double(components[2])
        )
    }
}
