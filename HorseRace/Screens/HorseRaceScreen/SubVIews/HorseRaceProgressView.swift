//
//  HorseRaceProgressView.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct HorseRaceProgressView: View {
    private let horse: Horse
    let trackLength: CGFloat = 250
    
    init(horse: Horse) {
        self.horse = horse
    }
    
    var body: some View {
        HStack {
            Text("Лошадь \(horse.id)")
                .frame(width: 80, alignment: .leading)
    
            let imageName = "horse\(horse.id)"
            
            if UIImage(named: imageName) != nil {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .offset(x: trackLength * CGFloat(horse.currentPosition) / 1.0 - 25)
                    .animation(.linear(duration: 0.1), value: horse.currentPosition)
            } else {
                Text("Нет картинки")
                    .frame(width: 50, height: 50)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
