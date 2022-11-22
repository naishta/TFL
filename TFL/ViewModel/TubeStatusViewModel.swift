import Foundation

final class TubeStatusViewModel: ObservableObject {
    @Published var tubeStatusItems: [TubeStatus] = []
    @Published var errorAlert: Error? = nil
    private let tubeStatusRepository: TubeStatusRepositoryType

    init(tubeStatusRepository: TubeStatusRepositoryType = TubeStatusRepository()) {
        self.tubeStatusRepository = tubeStatusRepository
    }

    @MainActor func getTubeStatus() async {
        do {
            tubeStatusItems = try await tubeStatusRepository.getTubeStatus()
        } catch {
            self.tubeStatusItems = []
            errorAlert = error
        }

    }
}
