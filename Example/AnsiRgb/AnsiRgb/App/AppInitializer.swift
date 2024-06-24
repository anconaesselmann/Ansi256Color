//  Created by Axel Ancona Esselmann on 6/23/24.
//  

import SwiftUI

@MainActor
class AppInitializer: ObservableObject {

    @Published
    var state: LoadableResult = .notStarted

    @MainActor
    func initialize() async {
        guard case .notStarted = state else {
            return
        }
        state = .loading
        do {
            try await Task.sleep(nanoseconds: 0)

            AppState.shared = AppState(

            )
            state = .success
        } catch {
            state = .failure(error)
        }
    }
}
