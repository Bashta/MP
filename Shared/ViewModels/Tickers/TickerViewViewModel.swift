//
//  TickerViewViewModel.swift
//  MP_APP
//
//  Created by Erison Veshi on 03/09/2022.
//

import Foundation

class TickerViewViewModel: ObservableObject {

    @Published var result: [Ticker] = []
    @Published var isLoading: Bool = false

    private let service: TickersServiceProtocol

    init(service: TickersServiceProtocol) {
        self.service = service
    }

    @MainActor
    func fetchTickers() async {
        isLoading = true
        switch await service.fetchTickers() {
        case .success(let res):
            result = res.results
        case .failure(let error):
            // TODO: Missing sad flow here
            print("Failed with error: \(error)")
        }
        isLoading = false
    }
}
