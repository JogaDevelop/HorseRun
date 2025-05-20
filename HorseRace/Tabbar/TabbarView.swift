//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct TabbarView: View {
    private let historyViewState = HistoryRaceViewState()

    var body: some View {
        TabView {
            HorseRaceAssembly.assemble(with: historyViewState)
                .tabItem {
                    Label("Horse Race", systemImage: "flag.filled.and.flag.crossed")
                }

            HistoryRaceAssembly.assemble(with: historyViewState)
                .tabItem {
                    Label("История", systemImage: "clock.arrow.circlepath")
                }
        }
    }
}
