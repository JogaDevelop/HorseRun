//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

enum HorseRaceAssembly {
    static func assemble(with historyViewState: HistoryRaceViewState) -> some View {
        let racingModel = HorseRaceModelImpl()
        let viewState = HorseRaceViewState()
        let viewModel = HorseRaceViewModelImpl(viewState: viewState, historyViewState: historyViewState, model: racingModel)
        let view = HorseRaceView(viewState: viewState, viewModel: viewModel)

        return view
    }
}
