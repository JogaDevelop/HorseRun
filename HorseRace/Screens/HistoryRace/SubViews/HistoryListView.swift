//
//  HistoryListView.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct HistoryListView: View {
    let winningHorses: [Horse] 

    var body: some View {
        LazyVStack {
            if winningHorses.isEmpty {
                Text("Нет данных")
                    .foregroundColor(.gray)
            } else {
                ForEach(Array(winningHorses.enumerated()), id: \.offset) { (index, horse) in
                    Text("Победила лошадь \(horse.id)")
                }
            }
        }
    }
}
