//
//  MP_APPApp.swift
//  Shared
//
//  Created by Erison Veshi on 02/09/2022.
//

import SwiftUI

@main
struct MP_APPApp: App {
    var body: some Scene {
        WindowGroup {
            TickersView(viewModel: .init(service: TickersService(client: HTTPClient())))
        }
    }
}
