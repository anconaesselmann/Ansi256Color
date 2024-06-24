//  Created by Axel Ancona Esselmann on 6/23/24.
//

import SwiftUI

public extension Color {
    init(r: UInt8, g: UInt8, b: UInt8) {
        self = Color(
            red:   Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255
        )
    }

    init(_ hex: (r: UInt8, g: UInt8, b: UInt8)) {
        self = Color(r: hex.r, g: hex.g, b: hex.b)
    }

    init(ansi256: Int) {
        self = Color(Ansi256Color(ansi256).rgb())
    }

    init(ansi256: UInt8) {
        self = Color(Ansi256Color(ansi256).rgb())
    }

    init(ansi256GrayScale value: Double) {
        self = Color(Ansi256Color(grayScale: value).rgb())
    }

    init(ansi256 value: Ansi256Color) {
        self = Color(value.rgb())
    }
}
