//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

public struct Ansi256Color {

    public let value: UInt8

    public var intValue: Int {
        Int(value)
    }

    private static let lowRgb: [(UInt8, UInt8, UInt8)] = [
        (0x00, 0x00, 0x00), (0x80, 0x00, 0x00), (0x00, 0x80, 0x00), (0x80, 0x80, 0x00),
        (0x00, 0x00, 0x80), (0x80, 0x00, 0x80), (0x00, 0x80, 0x80), (0xc0, 0xc0, 0xc0),

        (0x80, 0x80, 0x80), (0xff, 0x00, 0x00), (0x00, 0xff, 0x00), (0xff, 0xff, 0x00),
        (0x00, 0x00, 0xff), (0xff, 0x00, 0xff), (0x00, 0xff, 0xff) , (0xff, 0xff, 0xff)
    ]

    public init(_ value: UInt8) {
        self.value = value
    }

    public var rgb: (r: UInt8, g: UInt8, b: UInt8) {
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
}

public extension Ansi256Color {

    init(_ value: Int) {
        self = Ansi256Color(UInt8(value))
    }

    init(r: UInt8, g: UInt8, b: UInt8) {
        self = Ansi256Color((r, g, b))
    }

    init(_ rgb: (r: UInt8, g: UInt8, b: UInt8)) {
        let ra = UInt8(max((Double(Self.roundedToRgbValues(rgb.r)) - 55), 0) / 40)
        let ga = UInt8(max((Double(Self.roundedToRgbValues(rgb.g)) - 55), 0) / 40)
        let ba = UInt8(max((Double(Self.roundedToRgbValues(rgb.b)) - 55), 0) / 40)
        let b = ba
        let g = ga * 6
        let r = ra * 36
        let final = b + g + r + 16
        self = Ansi256Color(final)
    }

    init(red: Double, green: Double, blue: Double) {
        let r = Self.clamped(red)
        let g = Self.clamped(green)
        let b = Self.clamped(blue)
        self = Ansi256Color(r: r, g: g, b: b)
    }

    init(grayScale value: Double) {
        var value = value
        if value <= 0 {
            value = 0
        }
        if value >= 1 {
            value = 1
        }
        let scaled = Int(value * 24)
        self = Ansi256Color(232 + scaled)
    }

    private static func compressed(_ value: UInt8) -> UInt8 {
        UInt8(min(255, max(roundedToRgbValues(value) * 255, 0)))
    }

    private static func clamped(_ value: Double) -> UInt8 {
        UInt8(min(255, max(value * 255, 0)))
    }

    private static func roundedToRgbValues(_ value: UInt8) -> UInt8 {
        let rgbValues: [UInt8] = [
            0, 95, 135, 175, 215, 255
        ]
        guard 
            let range = zip(
                rgbValues.dropLast(),
                rgbValues.dropFirst()
            )
            .map({ $0...$1 })
            .first(where: { $0.contains(value) })
        else {
            return value
        }
        let middpoint = (range.upperBound - range.lowerBound) / 2 + range.lowerBound
        return value < middpoint
            ? range.lowerBound
            : range.upperBound
    }
}
