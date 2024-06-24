//  Created by Axel Ancona Esselmann on 6/23/24.
//  

import SwiftUI
import Ansi256Color

struct ContentView: View {

    @StateObject
    var vm = ContentViewModel()

    var body: some View {
        VStack {
            ColorPicker(selection: $vm.pickedColor, supportsOpacity: false) {
                Text("Pick a color")
            }
            HStack {
                Color(vm.pickedColor).frame(width: 40, height: 40)
                ColorSwatch(colorCode: vm.pickedAnsiColor.intValue)
            }
            Text("Named colors")
            HStack {
                ColorSwatch(colorCode: Ansi256Color.red.intValue)
                ColorSwatch(colorCode: Ansi256Color.green.intValue)
                ColorSwatch(colorCode: Ansi256Color.yellow.intValue)
                ColorSwatch(colorCode: Ansi256Color.blue.intValue)
                ColorSwatch(colorCode: Ansi256Color.magenta.intValue)
                ColorSwatch(colorCode: Ansi256Color.cyan.intValue)
                ColorSwatch(colorCode: Ansi256Color.white.intValue)
                ColorSwatch(colorCode: Ansi256Color.brown.intValue)
                ColorSwatch(colorCode: Ansi256Color.orange.intValue)
                ColorSwatch(colorCode: Ansi256Color.purple.intValue)
                ColorSwatch(colorCode: Ansi256Color.lightGray.intValue)
                ColorSwatch(colorCode: Ansi256Color.gray.intValue)
                ColorSwatch(colorCode: Ansi256Color.darkGray.intValue)
                ColorSwatch(colorCode: Ansi256Color.black.intValue)
            }
            Text("Standard colors")
            HStack {
                ForEach(0..<8) {
                    ColorSwatch(colorCode: $0)
                }
            }
            Text("High-intensity colors")
            HStack {
                ForEach(8..<16) {
                    ColorSwatch(colorCode: $0)
                }
            }
            Text("216 colors")
            VStack {
                ForEach(0..<6) { row in
                    HStack {
                        let from = 16 + row * 36
                        let to = from + 36
                        let range = from..<to
                        ForEach(range, id: \.self) {
                            ColorSwatch(colorCode: $0)
                        }
                    }
                }
            }
            Text("Grayscale colors")
            HStack {
                ForEach(232..<256) {
                    ColorSwatch(colorCode: $0)
                }
            }
            Text("Grayscale colors by intensity")
            HStack {
                ForEach(0..<24) {
                    ColorSwatchGrayScale(scale: $0)
                }
            }
        }
        .padding()
    }
}
