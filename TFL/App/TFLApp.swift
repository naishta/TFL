import SwiftUI

@main
struct TFLApp: App {
    var body: some Scene {
        WindowGroup {
            TubeStatusView(viewModel: TubeStatusViewModel())
        }
    }
}
