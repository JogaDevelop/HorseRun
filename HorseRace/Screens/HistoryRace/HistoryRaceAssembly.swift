//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

enum HistoryRaceAssembly {
    static func assemble(with historyViewState: HistoryRaceViewState) -> some View {
        let viewModel = HistoryRaceViewModelImpl(viewState: historyViewState)
        let view = HistoryRaceView(viewState: historyViewState, viewModel: viewModel)

        return view
    }
}
