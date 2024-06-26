//  Created by Axel Ancona Esselmann on 6/24/24.
//

import SwiftUI
import Ansi256Color

struct ColorSwatch: View {
    let size: CGFloat = 40
    let colorCode: Int

    var ansiColor: Ansi256Color {
        Ansi256Color(colorCode)
    }
    var color: Color {
        Color(ansi256: ansiColor)
    }
    
    var body: some View {
        ZStack {
            Color(.displayP3, ansi256: colorCode)
                .frame(width: size, height: size)
            Text(String(colorCode))
                .hightContrastForegroundColor(for: color)
        }
    }
}
