import SwiftUI

struct TubeStatusView: View {
    @ObservedObject var viewModel: TubeStatusViewModel

    var body: some View {
        Navigation(title: "Tube Status", style: .large) {
            List(viewModel.tubeStatusItems, id: \.id) { item in
                HStack {
                    item.tubeColor
                        .frame(width: 10)
                    Text(item.name)
                    Spacer()
                    Text(item.firstLineStatus?.statusSeverityDescription ?? "N/A")
                }
            }
            .task {
                await viewModel.getTubeStatus()
            }
            .errorAlert(error: $viewModel.errorAlert)
        }
    }
}
