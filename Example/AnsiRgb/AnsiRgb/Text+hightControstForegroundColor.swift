//  Created by Axel Ancona Esselmann on 6/24/24.
//

import SwiftUI

extension Text {
    func hightContrastForegroundColor(for backgroundColor: Color) -> some View {
        foregroundColor(backgroundColor.hightContrastFontColor)
    }
}
