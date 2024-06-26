//  Created by Axel Ancona Esselmann on 6/24/24.
//

import SwiftUI
import Ansi256Color

class ContentViewModel: ObservableObject {

    @Published
    var pickedColor: Color = .blue

    var pickedAnsiColor: Ansi256Color {
        let (red, green, blue) = pickedColor.rgb
        return Ansi256Color(
            red: red,
            green: green,
            blue: blue
        )
    }
}
