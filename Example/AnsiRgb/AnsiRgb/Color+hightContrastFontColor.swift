//  Created by Axel Ancona Esselmann on 6/24/24.
//

import SwiftUI

extension Color {
    var hightControstFontColor: Color {
        let components = NSColor(self).cgColor.components
        let red  = components?[0] ?? 0
        let green = components?[1] ?? 0
        let blue = components?[2] ?? 0
        // https://en.wikipedia.org/wiki/Relative_luminance
        let luminance = 0.2126 * red + 0.7152 * green + 0.0722 * blue
        return luminance < 0.55
            ? .white
            : .black
    }
}
