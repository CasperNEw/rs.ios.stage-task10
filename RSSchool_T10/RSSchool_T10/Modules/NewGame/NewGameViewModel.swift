//
//  NewGameViewModel.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 27.08.2021.
//

import Foundation

struct Player: Equatable {
	let uuid: String = UUID().uuidString
    let name: String
}

protocol NewGameViewModelProtocol: AnyObject {

    func getPlayers() -> [Player]
    func updatePlayers(_ players: [Player])
	func addPlayer(_ name: String)

	var playersDidChange: (() -> ())? { get set }
}

final class NewGameViewModel: NewGameViewModelProtocol {

    private var repository: [Player] = [.init(name: "Саша"),
                                        .init(name: "Маша"),
                                        .init(name: "Наташа")] {
        didSet {
            print(repository)
        }
    }

	var playersDidChange: (() -> ())?

    func getPlayers() -> [Player] {
        return repository
    }

	func updatePlayers(_ players: [Player]) {
		repository = players
	}

	func addPlayer(_ name: String) {
		repository.append(.init(name: name))
		playersDidChange?()
	}
}
