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
        let c = Ansi256Color(red: red, green: green, blue: blue)
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

    var components: [CGFloat] {
        #if os(macOS)
        NSColor(self).cgColor.components ?? [0,0,0]
        #else
        UIColor(self).cgColor.components ?? [0,0,0]
        #endif
    }

    var rgb: (r: Double, g: Double, b: Double) {
        let components = components
        return (
            r: Double(components[0]),
            g: Double(components[1]),
            b: Double(components[2])
        )
    }

    var hightContrastFontColor: Color {
        let (red, green, blue) = rgb
        // https://en.wikipedia.org/wiki/Relative_luminance
        let luminance = 0.2126 * red + 0.7152 * green + 0.0722 * blue
        return luminance < 0.55
            ? .white
            : .black
    }

    var inverted: Color {
        let (red, green, blue) = rgb
        return Color(
            red: 1 - red,
            green: 1 - green,
            blue: 1 - blue
        )
    }
}

public extension Ansi256Color {
    init(_ color: Color) {
        let (red, green, blue) = color.rgb
        self = Ansi256Color(
            red: red,
            green: green,
            blue: blue
        )
    }
}
