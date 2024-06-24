//  Created by Axel Ancona Esselmann on 6/24/24.
//

import Foundation

public extension Ansi256Color {
    public static var red: Ansi256Color {
        Ansi256Color(r: 255, g: 0, b: 0)
    }
    public static var green: Ansi256Color {
        Ansi256Color(r: 0, g: 255, b: 0)
    }
    public static var yellow: Ansi256Color {
        Ansi256Color(r: 255, g: 255, b: 0)
    }
    public static var blue: Ansi256Color {
        Ansi256Color(r: 0, g: 0, b: 255)
    }
    public static var magenta: Ansi256Color {
        Ansi256Color(r: 255, g: 0, b: 255)
    }
    public static var cyan: Ansi256Color {
        Ansi256Color(r: 0, g: 255, b: 255)
    }
    public static var white: Ansi256Color {
        Ansi256Color(r: 255, g: 255, b: 255)
    }


    public static var brown: Ansi256Color {
        Ansi256Color(red: 0.6, green: 0.4, blue: 0.2)
    }
    public static var orange: Ansi256Color {
        Ansi256Color(red: 1.0, green: 0.5, blue: 0.0)
    }
    public static var purple: Ansi256Color {
        Ansi256Color(red: 0.5, green: 0.0, blue: 0.5)
    }

    public static var lightGray: Ansi256Color {
        Ansi256Color(grayScale: 2 / 3)
    }
    public static var gray: Ansi256Color {
        Ansi256Color(grayScale: 0.5)
    }
    public static var darkGray: Ansi256Color {
        Ansi256Color(grayScale: 1 / 3)
    }
    public static var black: Ansi256Color {
        Ansi256Color(grayScale: 0)
    }
}
