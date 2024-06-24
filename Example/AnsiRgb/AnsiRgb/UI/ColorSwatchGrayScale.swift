//  Created by Axel Ancona Esselmann on 6/24/24.
//

import SwiftUI
import Ansi256Color

struct ColorSwatchGrayScale: View {
    let size: CGFloat = 40
    let scale: Int
    var body: some View {
        ZStack {
            let value = Double(scale) / 24
            Color(ansi256GrayScale: value)
                .frame(width: size, height: size)
            Text("\(value, specifier: "%.2f")")
        }
    }
}
