//
//  Untitled 2.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct HorseRaceWinnerView: View {
    let winnerName: String?

    var body: some View {
        if let name = winnerName {
            Text("Победитель: \(name) 🎉")
                .font(.headline)
                .padding()
                .foregroundColor(.primary)
        } else {
            Text("")
                .font(.headline)
                .padding()
                .foregroundColor(.clear)
        }
    }
}
