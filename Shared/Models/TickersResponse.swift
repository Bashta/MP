//
//  TickersResponse.swift
//  MP_APP
//
//  Created by Erison Veshi on 03/09/2022.
//

import Foundation

struct TickersResponse: Codable {
    let count: Int
    let nextURL: String
    let requestID: String
    let results: [Ticker]
    let status: String

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case nextURL = "next_url"
        case requestID = "request_id"
        case results = "results"
        case status = "status"
    }
}

struct Ticker: Codable {
    let active: Bool
    let cik: String
    let compositeFigi: String
    let currencyName: String
    let lastUpdatedUTC: Date
    let locale: String
    let market: String
    let name: String
    let primaryExchange: String
    let shareClassFigi: String
    let ticker: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case active = "active"
        case cik = "cik"
        case compositeFigi = "composite_figi"
        case currencyName = "currency_name"
        case lastUpdatedUTC = "last_updated_utc"
        case locale = "locale"
        case market = "market"
        case name = "name"
        case primaryExchange = "primary_exchange"
        case shareClassFigi = "share_class_figi"
        case ticker = "ticker"
        case type = "type"
    }
}
