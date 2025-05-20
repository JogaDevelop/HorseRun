//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

import SwiftUI

struct ActionButton: View {
    private let text: String
    private let color: Color
    private let action: (() -> Void)?

    init(text: String, color: Color, action: (() -> Void)?) {
        self.text = text
        self.color = color
        self.action = action
    }

    var body: some View {
        Button {
            action?()
        } label: {
            Text(text)
                .contentShape(Rectangle())
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

