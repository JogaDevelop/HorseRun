//
//  HorseRaceApp.swift
//  HorseRace
//
//  Created by macbook-pro-2019 on 19.05.2025.
//

protocol HorseRaceModel: AnyObject {
    func runHorseRacing(horses: [Horse]) async -> [Horse]
}

final class HorseRaceModelImpl: HorseRaceModel {
    func runHorseRacing(horses: [Horse]) async -> [Horse] {
        await withTaskGroup(of: Horse.self, returning: [Horse].self) { group in
            for horse in horses {
                group.addTask {
                    await self.runHorse(horse)
                }
            }

            var horses: [Horse] = []
            for await horse in group {
                horses.append(horse)
            }

            return horses
        }
    }
}

// MARK: - Private Methods
extension HorseRaceModelImpl {
    private func runHorse(_ horse: Horse) async -> Horse {
        guard horse.currentPosition <= 1 else { return horse }

        let increment = Double.random(in: 0.005...0.02)
        try? await Task.sleep(nanoseconds: UInt64(Double.random(in: 0.02...0.04) * 1_000_000_000))

        return Horse(id: horse.id, currentPosition: min(horse.currentPosition + increment, 1.0))
    }
}
