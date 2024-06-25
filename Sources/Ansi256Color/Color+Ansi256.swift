//  Created by Axel Ancona Esselmann on 6/23/24.
//

import SwiftUI

public extension Color {
    init(
        _ colorSpace: Color.RGBColorSpace = .sRGB,
        r: UInt8, g: UInt8, b: UInt8
    ) {
        let red   = Double(r) / 255
        let green = Double(g) / 255
        let blue  = Double(b) / 255
        print(r, g, b)
        print(red, green, blue)
        let c = Ansi256Color(red: red, green: green, blue: blue)
        print(c.intValue)
        print(c.rgb)
        self = Color(colorSpace,
            red:   red,
            green: green,
            blue:  blue
        )
    }

    init(
        _ colorSpace: Color.RGBColorSpace = .sRGB,
        _ hex: (r: UInt8, g: UInt8, b: UInt8)
    ) {
        self = Color(colorSpace, r: hex.r, g: hex.g, b: hex.b)
    }

    init(
        _ colorSpace: Color.RGBColorSpace = .sRGB,
        ansi256: Int
    ) {
        self = Color(colorSpace, Ansi256Color(ansi256).rgb)
    }

    init(
        _ colorSpace: Color.RGBColorSpace = .sRGB,
        ansi256: UInt8
    ) {
        self = Color(colorSpace, Ansi256Color(ansi256).rgb)
    }

    init(
        _ colorSpace: Color.RGBColorSpace = .sRGB,
        ansi256GrayScale value: Double
    ) {
        self = Color(colorSpace, Ansi256Color(grayScale: value).rgb)
    }

    init(
        _ colorSpace: Color.RGBColorSpace = .sRGB,
        ansi256 value: Ansi256Color
    ) {
        self = Color(colorSpace, value.rgb)
    }
}
