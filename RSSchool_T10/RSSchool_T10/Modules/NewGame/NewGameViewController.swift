//
//  NewGameViewController.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 26.08.2021.
//

import UIKit

class NewGameViewController: UIViewController {

    let viewModel = NewGameViewModel()

    // MARK: - Lifecycle
    override func loadView() {
        let view = NewGameView()
        view.delegate = self
        view.viewModel = viewModel
        self.view = view
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupNavigationBar()
	}

	// MARK: - Privates

	private func setupNavigationBar() {
		if navigationController?.viewControllers.count == 1 {
			navigationItem.leftBarButtonItems = nil
			return
		}
		let leftItem = UIBarButtonItem(title: "Cancel", style: .plain,
									   target: self, action: #selector(cancelTapped))
		setLeftNavigationButton(leftItem)
	}

	// MARK: - Actions

	@objc private func cancelTapped() {
		navigationController?.popViewController(animated: true)
	}
}

// MARK: - NewGameViewDelegate
extension NewGameViewController: NewGameViewDelegate {

    func addPlayerTapped() {
		let addViewController = AddPlayerViewController()
		addViewController.delegate = self
		navigationController?.pushViewController(addViewController, animated: true)
    }

    func startButtonTapped() {
		let viewController = GameProcessViewController(players: viewModel.getPlayers())
		navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - AddPlayerDelegate
extension NewGameViewController: AddPlayerDelegate {

	func addPlayer(_ player: String) {
		viewModel.addPlayer(player)
	}
}
