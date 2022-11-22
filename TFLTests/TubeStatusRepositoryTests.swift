import XCTest
@testable import TFL

final class TubeStatusRepositoryTests: XCTestCase {
    var networkProvider = MockNetworkProvider()

    func testTubeStatusRepository() async throws {
        // Given
        let repository = TubeStatusRepository(networkProvider: networkProvider)
        let expectedTubeStatusItems = [TubeStatus(id: "1",
                                                  name: "Circle",
                                                  lineStatuses: [LineStatus(id: 1, statusSeverityDescription: "Planned Closure")])]

        // When
        let result = try await repository.getTubeStatus()

        // Then
        XCTAssertEqual(result, expectedTubeStatusItems)
    }
}


final class MockNetworkProvider: NetworkProviderType {
    func request<T>(dataType: T.Type, service: TFL.NetworkService, onQueue: DispatchQueue) async throws -> T where T : Decodable {
        
        [TubeStatus(id: "1",
                    name: "Circle",
                    lineStatuses: [LineStatus(id: 1,
                                              statusSeverityDescription: "Planned Closure")])]  as! T
    }
}
