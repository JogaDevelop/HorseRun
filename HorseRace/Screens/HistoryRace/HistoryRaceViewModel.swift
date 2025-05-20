//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

protocol HistoryRaceCleanable: AnyObject {
    func cleanHistory()
}

final class HistoryRaceViewModelImpl {
    private let viewState: HistoryRaceViewState

    init(viewState: HistoryRaceViewState) {
        self.viewState = viewState
    }
}

extension HistoryRaceViewModelImpl: HistoryRaceCleanable {
    func cleanHistory() {
        viewState.winningHorses = []
    }
}
