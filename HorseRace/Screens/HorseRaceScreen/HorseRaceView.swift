//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct HorseRaceView: View {
    @ObservedObject private var viewState: HorseRaceViewState
   
    private let viewModel: HorseRaceControlable
    
    init(viewState: HorseRaceViewState, viewModel: HorseRaceControlable) {
        _viewState = ObservedObject(wrappedValue: viewState)
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("Horse Race")
                .font(.title)
                .padding()
            
            Spacer()
            
            HorseRaceWinnerView(winnerName: viewState.winningHorseName)
            
            ForEach(viewState.horses, id: \.id) { horse in
                HorseRaceProgressView(horse: horse)
            }
            
            Spacer()
            
            HorseRaceControlView(viewState: viewState, viewModel: viewModel)
        }
        .padding()
    }
}




