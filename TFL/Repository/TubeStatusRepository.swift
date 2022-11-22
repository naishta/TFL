import Foundation

protocol TubeStatusRepositoryType {
    func getTubeStatus() async throws -> [TubeStatus]
}

final class TubeStatusRepository: TubeStatusRepositoryType {
    let networkProvider: NetworkProviderType

    init(networkProvider: NetworkProviderType = NetworkProvider()) {
        self.networkProvider = networkProvider
    }

    func getTubeStatus() async throws -> [TubeStatus] {
        return try await networkProvider.request(dataType: [TubeStatus].self,
                                                 service: TubeStatusService(),
                                                 onQueue: .main)
    }
}
