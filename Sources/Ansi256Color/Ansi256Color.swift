//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

public struct Ansi256Color {
    public let value: UInt8

    public init(_ value: UInt8) {
        self.value = value
    }

    public init(_ value: Int) {
        self.value = UInt8(value)
    }

    public init(r: UInt8, g: UInt8, b: UInt8) {
        self = Ansi256Color((r, g, b))
    }

    public init(_ rgb: (r: UInt8, g: UInt8, b: UInt8)) {
        let ra = UInt8(max((Double(rgb.r) - 55), 0) / 40)
        let ga = UInt8(max((Double(rgb.g) - 55), 0) / 40)
        let ba = UInt8(max((Double(rgb.b) - 55), 0) / 40)
        let b = ba
        let g = ga * 6
        let r = ra * 36
        let final = b + g + r + 16
        value = final
    }

    private static let lowRgb: [(UInt8, UInt8, UInt8)] = [
        (0x00, 0x00, 0x00), (0x80, 0x00, 0x00), (0x00, 0x80, 0x00), (0x80, 0x80, 0x00),
        (0x00, 0x00, 0x80), (0x80, 0x00, 0x80), (0x00, 0x80, 0x80), (0xc0, 0xc0, 0xc0),

        (0x80, 0x80, 0x80), (0xff, 0x00, 0x00), (0x00, 0xff, 0x00), (0xff, 0xff, 0x00),
        (0x00, 0x00, 0xff), (0xff, 0x00, 0xff), (0x00, 0xff, 0xff) , (0xff, 0xff, 0xff)
    ]

    internal func rgb() -> (UInt8, UInt8, UInt8) {
        if (value < 16) {
            return Self.lowRgb[Int(value)]
        }
        if (value > 231) {
            let s = (value - 232) * 10 + 8
            return (s, s, s)
        }
        let n = value - 16
        let b = n % 6
        let g = (n - b) / 6 % 6
        let r = (n - b - g * 6) / 36 % 6
        let blue  = b > 0 ? b * 40 + 55 : 0
        let red   = r > 0 ? r * 40 + 55 : 0
        let green = g > 0 ? g * 40 + 55 : 0
        return (red, green, blue)
    }

    public static let red    = Ansi256Color(r: 255, g: 0, b: 0)
    public static let green  = Ansi256Color(r: 0, g: 255, b: 0)
    public static let yellow = Ansi256Color(r: 255, g: 255, b: 0)
    public static let blue   = Ansi256Color(r: 0, g: 0, b: 255)
    public static let pink   = Ansi256Color(r: 255, g: 0, b: 255)
    public static let cyan   = Ansi256Color(r: 0, g: 255, b: 255)
    public static let white  = Ansi256Color(r: 255, g: 255, b: 255)
}
