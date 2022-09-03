//
//  Endpoint.swift
//  MP_APP
//
//  Created by Erison Veshi on 02/09/2022.
//


protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "api.polygon.io"
    }
}
