//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct HistoryRaceView: View {
    @ObservedObject private var viewState: HistoryRaceViewState
    @State private var notificationsEnabled = false

    private let viewModel: HistoryRaceCleanable

    init(viewState: HistoryRaceViewState, viewModel: HistoryRaceCleanable) {
        _viewState = ObservedObject(wrappedValue: viewState)
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    
                    LazyVStack {
                        HistoryListView(winningHorses: viewState.winningHorses)
                    }
                }
                HistoryControlView(viewModel: viewModel)
                
            }
            .navigationTitle("История")
        }
    }
}

