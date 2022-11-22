import Foundation

final class TubeStatusService: NetworkService {
    var baseURL: String {
        "https://api.tfl.gov.uk"
    }

    var path: String {
        "/Line/Mode/Tube/Status"
    }

    var method: HttpMethod {
        .get
    }

    var httpBody: Encodable? {
        nil
    }

    var headers: [String : String]? {
        nil
    }

    var queryParameters: [URLQueryItem]? {
        nil
    }

    var timeout: TimeInterval? {
        60
    }
}
