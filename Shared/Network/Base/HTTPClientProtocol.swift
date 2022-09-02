//
//  HTTPClient.swift
//  MP_APP
//
//  Created by Erison Veshi on 02/09/2022.
//

import Foundation

protocol HTTPClientProtocol {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

struct HTTPClient: HTTPClientProtocol {

    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        guard let (data, response) = try? await URLSession.shared.data(for: request, delegate: nil) else {
            return .failure(.unknown)
        }

        guard let response = response as? HTTPURLResponse else {
            return .failure(.noResponse)
        }
        
        switch response.statusCode {
        case 200...299:
            guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                return .failure(.decode)
            }
            return .success(decodedResponse)
            
        case 401:
            return .failure(.unauthorized)
            
        default:
            return .failure(.unexpectedStatusCode)
        }
    }

}
