//
//  TickersView.swift
//  MP_APP
//
//  Created by Erison Veshi on 02/09/2022.
//

import SwiftUI

class TickerViewViewModel: ObservableObject {
    
    @Published var result: [Ticker] = []
    @Published var isLoading: Bool = false
    
    private let service: TickersServiceProtocol
    
    init(service: TickersService) {
        self.service = service
    }
}

struct TickersView: View {

    private let viewModel: TickerViewViewModel

    init(viewModel: TickerViewViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            Text("Appl")
            Text("665$")
        }
    }
}

struct TickersView_Previews: PreviewProvider {
    static var previews: some View {
        TickersView(viewModel: .init(service: .init(client: HTTPClient())))
    }
}
