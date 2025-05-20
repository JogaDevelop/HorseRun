//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

final class HistoryRaceViewState: ObservableObject {
    @Published var winningHorses: [Horse] = []
}
