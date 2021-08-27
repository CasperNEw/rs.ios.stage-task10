//
//  NewGameViewModel.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 27.08.2021.
//

import Foundation

struct Player: Equatable {
    let uuid: UUID
    let name: String
}

protocol NewGameViewModelProtocol: AnyObject {

    func getPlayers() -> [Player]
    func updatePlayers(_ players: [Player])
}

final class NewGameViewModel: NewGameViewModelProtocol {

    private var repository: [Player] = [.init(uuid: UUID(), name: "Саша"),
                                        .init(uuid: UUID(), name: "Маша"),
                                        .init(uuid: UUID(), name: "Наташа")] {
        didSet {
            print(repository)
        }
    }

    func updatePlayers(_ players: [Player]) {
        repository = players
    }

    func getPlayers() -> [Player] {
        return repository
    }
}
