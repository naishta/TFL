import Foundation

public enum Environment {
    public static let successStatusCodeRange: Range<Int> = 200 ..< 300
    public static let requestDefaultTimeout: TimeInterval = 60
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
