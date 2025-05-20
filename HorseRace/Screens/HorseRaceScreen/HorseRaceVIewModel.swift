//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

@MainActor
protocol HorseRaceControlable {
    func startRace()
    func stopRace()
}

final class HorseRaceViewModelImpl {
    private let viewState: HorseRaceViewState
    private let historyViewState: HistoryRaceViewState
    private let model: HorseRaceModel

    init(
        viewState: HorseRaceViewState,
        historyViewState: HistoryRaceViewState,
        model: HorseRaceModel
    ) {
        self.viewState = viewState
        self.historyViewState = historyViewState
        self.model = model
    }
}

// MARK: - RacingViewModel
extension HorseRaceViewModelImpl: HorseRaceControlable {
    func startRace() {
        guard !viewState.isRunning else { return }

        Task {
            viewState.isRunning = true
            resetHorsesPositions()

            while viewState.isRunning {
                let horses = await model.runHorseRacing(horses: viewState.horses)

                for horse in horses {
                    guard let index = viewState.horses.firstIndex(where: { $0.id == horse.id }) else { return }

                    viewState.horses[index].currentPosition = horse.currentPosition
                }

                if let winningHorse = viewState.horses.first(where: { $0.currentPosition >= 1 }) {
                    viewState.isRunning = false
                    viewState.winningHorseName = "Лошадь \(winningHorse.id)"
                    historyViewState.winningHorses.insert(winningHorse, at: 0)
                }
            }
        }
    }

    func stopRace() {
        viewState.isRunning = false // Останавливаем гонку
    }
}

// MARK: - Private Methods
extension HorseRaceViewModelImpl {
    private func resetHorsesPositions() {
        viewState.horses = [
            Horse(id: 1, currentPosition: 0),
            Horse(id: 2, currentPosition: 0),
            Horse(id: 3, currentPosition: 0),
            Horse(id: 4, currentPosition: 0),
            Horse(id: 5, currentPosition: 0)
        ]
    }
}
