//
//  HistoryControlView.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct HistoryControlView: View {
    let viewModel: HistoryRaceCleanable

    var body: some View {
        VStack {
            Spacer()
            ActionButton(text: "Очистить историю", color: .red) {
                viewModel.cleanHistory()
            }
            .padding(16)
        }
    }
}
