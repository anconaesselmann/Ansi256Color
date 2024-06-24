//  Created by Axel Ancona Esselmann on 6/23/24.
//  

import SwiftUI
import Ansi256Color

struct ContentView: View {
    let size: CGFloat = 40

    var body: some View {
        VStack {
            HStack {
                Color(ansi256: Ansi256Color.red.value)
                    .frame(width: size, height: size)
                Color(ansi256: Ansi256Color.green.value)
                    .frame(width: size, height: size)
                Color(ansi256: Ansi256Color.yellow.value)
                    .frame(width: size, height: size)
                Color(ansi256: Ansi256Color.blue.value)
                    .frame(width: size, height: size)
                Color(ansi256: Ansi256Color.pink.value)
                    .frame(width: size, height: size)
                Color(ansi256: Ansi256Color.cyan.value)
                    .frame(width: size, height: size)
                Color(ansi256: Ansi256Color.white.value)
                    .frame(width: size, height: size)
            }
            HStack {
                ForEach(0..<16) {
                    Color(ansi256: $0)
                        .frame(width: size, height: size)
                }
            }
            VStack {
                ForEach(0..<6) { row in
                    HStack {
                        let from = 16 + row * 36
                        let to = from + 36
                        let range = from..<to
                        ForEach(range, id: \.self) {
                            Color(ansi256: $0)
                                .frame(width: size, height: size)
                        }
                    }
                }
            }
            HStack {
                ForEach(232..<256) {
                    Color(ansi256: $0)
                        .frame(width: size, height: size)
                }
            }
            HStack {
                ForEach(0..<24) {
                    Color(ansi256GrayScale: Double($0) / 24 )
                        .frame(width: size, height: size)
                }
            }
        }
        .padding()
    }
}
