//
//  TickersEndpoint.swift
//  MP_APP
//
//  Created by Erison Veshi on 02/09/2022.
//

enum TickersEndpoint {
    case tickers
    case ticker(id: String)
}

extension TickersEndpoint: Endpoint {
    var path: String {
        switch self {
        case .tickers, .ticker:
            return "/v3/reference/tickers"
        }
    }

    var method: RequestMethod {
        switch self {
        case .tickers, .ticker:
            return .get
        }
    }

    var header: [String: String]? {
        
        let accessToken = EnviromentConfig().polygonApiKey
        switch self {
        case .tickers, .ticker:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    var body: [String: String]? {
        switch self {
        case .tickers, .ticker:
            return nil
        }
    }
}
