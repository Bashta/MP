//
//  TickersView.swift
//  MP_APP
//
//  Created by Erison Veshi on 02/09/2022.
//

import SwiftUI

struct TickersView: View {

    @StateObject var viewModel: TickerViewViewModel

    var body: some View {
        HStack {
            List(viewModel.result) {
                Text($0.ticker ?? "Missing ticker name")
            }
        }
        .navigationTitle("Tickers")
        .task { await viewModel.fetchTickers() }
    }
}

struct TickersView_Previews: PreviewProvider {
    static var previews: some View {
        TickersView(viewModel: TickerViewViewModel(service: TickersService(client: HTTPClient())) )
    }
}
