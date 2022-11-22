import Foundation

public protocol NetworkProviderType {
    func request<T: Decodable>(dataType: T.Type, service: NetworkService,
                               onQueue: DispatchQueue) async throws -> T
}

public struct NetworkProvider: NetworkProviderType {
    public let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func request<T: Decodable>(dataType: T.Type, service: NetworkService,
                                      onQueue: DispatchQueue) async throws -> T where T: Decodable {
        do {
            let (data, response) = try await session.data(for: service.urlRequest)
            try self.validate(response: response, statusCodes: Environment.successStatusCodeRange)
            return try self.decode(data: data, type: dataType)
        } catch {
            throw NetworkError.requestFailed(error: error)
        }
    }
}

private extension NetworkProvider {
    func validate(response: URLResponse?, statusCodes: Range<Int>) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknownStatusCode
        }

        if !statusCodes.contains(httpResponse.statusCode) {
            throw NetworkError.unexpectedStatusCode(code: httpResponse.statusCode)
        }
    }

    func decode<T: Decodable>(data: Data?, type: T.Type) throws -> T {
        guard let data = data, !data.isEmpty else {
            throw NetworkError.contentEmptyData
        }

        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.contentDecoding(error: error)
        }
    }
}
