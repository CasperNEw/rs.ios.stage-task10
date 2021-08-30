//
//  GameProcessViewController.swift
//  RSSchool_T10
//
//  Created by 19046471 on 30.08.2021.
//

import UIKit

class GameProcessViewController: UIViewController {

	// MARK: - Properties
	private let players: [Player]

	// MARK: - Initialization
	init(players: [Player]) {
		self.players = players
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func loadView() {
		let view = GameProcessView()
		view.configure(with: players)
		self.view = view
	}

	override func viewDidLoad() {
		setupNavigationBar()
	}

	// MARK: - Privates

	private func setupNavigationBar() {
		let leftItem = UIBarButtonItem(title: "New Game", style: .plain,
									   target: self, action: #selector(newGameTapped))

		let rightItem = UIBarButtonItem(title: "Result", style: .plain,
										target: self, action: #selector(resultTapped))
		setLeftNavigationButton(leftItem)
		setRightNavigationButton(rightItem)
	}



	// MARK: - Actions

	@objc private func newGameTapped() {
	}

	@objc private func resultTapped() {
	}
}
