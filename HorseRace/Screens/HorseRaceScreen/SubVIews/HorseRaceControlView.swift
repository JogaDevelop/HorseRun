//
//  Untitled.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct HorseRaceControlView: View {
    @ObservedObject var viewState: HorseRaceViewState
    let viewModel: HorseRaceControlable

    var body: some View {
        if viewState.isRunning {
            ActionButton(text: "Stop", color: .red) {
                viewModel.stopRace()
            }
        } else {
            ActionButton(text: "Start", color: .blue) {
                viewModel.startRace()
            }
        }
    }
}
