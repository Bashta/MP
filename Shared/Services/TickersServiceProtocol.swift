//
//  TickersServiceProtocol.swift
//  RequestApp
//
//  Created by Erison Veshi on 02/09/2022.
//

import Foundation

protocol TickersServiceProtocol {
    func fetchTickers() async -> Result<TickersResponse, RequestError>
}

struct TickersService {
    
    private let client: HTTPClientProtocol
    
    init(client: HTTPClientProtocol) {
        self.client = client
    }
}

extension TickersService: TickersServiceProtocol {

    func fetchTickers() async -> Result<TickersResponse, RequestError> {
        return await client.sendRequest(endpoint: TickersEndpoint.tickers, responseModel: TickersResponse.self)
    }
}
