//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

final class HorseRaceViewState: ObservableObject {
    @Published var winningHorseName: String? 
    @Published var horses: [Horse] = [
        Horse(id: 1, currentPosition: 0),
        Horse(id: 2, currentPosition: 0),
        Horse(id: 3, currentPosition: 0),
        Horse(id: 4, currentPosition: 0),
        Horse(id: 5, currentPosition: 0)
    ]
    @Published var isRunning = false
}
