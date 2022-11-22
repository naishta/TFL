import XCTest
@testable import TFL

final class TubeStatusViewModelTests: XCTestCase {
    var mockTubeStatusRepository: TubeStatusRepositoryType = MockTubeStatusRepository()
    var mockTubeStatusRepositoryError: TubeStatusRepositoryType = MockTubeStatusRepositoryError()

    func testTubeStatusSuccess() async {
        // Given
        let viewModel = TubeStatusViewModel(tubeStatusRepository: mockTubeStatusRepository)
        let expectedTubeStatusItems = [TubeStatus(id: "1",
                                                  name: "Bakerloo",
                                                  lineStatuses: [LineStatus(id: 1, statusSeverityDescription: "Good Service")])]

        // When
        await viewModel.getTubeStatus()


        // Then
        XCTAssertEqual(viewModel.tubeStatusItems, expectedTubeStatusItems)
    }

    func testTubeStatusEmpty() async {
        // Given
        let viewModel = TubeStatusViewModel(tubeStatusRepository: mockTubeStatusRepositoryError)

        // When
        await viewModel.getTubeStatus()

        // Then
        XCTAssertEqual(viewModel.tubeStatusItems, [])
    }

    func testTubeStatusError() async {
        // Given
        let viewModel = TubeStatusViewModel(tubeStatusRepository: mockTubeStatusRepositoryError)

        // When
        await viewModel.getTubeStatus()

        // Then
        XCTAssertNotNil(viewModel.errorAlert)
    }
}

final class MockTubeStatusRepository: TubeStatusRepositoryType {
    func getTubeStatus() async throws -> [TFL.TubeStatus] {
        [TFL.TubeStatus(id: "1",
                        name: "Bakerloo",
                        lineStatuses: [LineStatus(id: 1, statusSeverityDescription: "Good Service")])]
    }
}

final class MockTubeStatusRepositoryError: TubeStatusRepositoryType {
    func getTubeStatus() async throws -> [TFL.TubeStatus] {
        throw NetworkError.contentEmptyData
    }
}
