//
//  AddPlayerViewController.swift
//  RSSchool_T10
//
//  Created by 19046471 on 30.08.2021.
//

import UIKit

protocol AddPlayerDelegate: AnyObject {
	func addPlayer(_ player: String)
}

class AddPlayerViewController: UIViewController {

	// MARK: - Properties
	weak var delegate: AddPlayerDelegate?
	private var currentName = ""

	// MARK: - Lifecycle
	override func loadView() {
		let view = AddPlayerView()
		view.delegate = self
		self.view = view
	}

	override func viewDidLoad() {
		setupNavigationBar()
	}

	// MARK: - Privates

	private func setupNavigationBar() {
		let leftItem = UIBarButtonItem(title: "Back", style: .plain,
									   target: self, action: #selector(backTapped))

		let rightItem = UIBarButtonItem(title: "Add", style: .plain,
										target: self, action: #selector(addTapped))
		setLeftNavigationButton(leftItem)
		setRightNavigationButton(rightItem)
	}



	// MARK: - Actions

	@objc private func backTapped() {
		navigationController?.popViewController(animated: true)
	}

	@objc private func addTapped() {
		guard !currentName.isEmpty else { return }
		delegate?.addPlayer(currentName)
		backTapped()
	}
}

// MARK: - AddPlayerViewDelegate
extension AddPlayerViewController: AddPlayerViewDelegate {

	func didChangeText(_ text: String?) {
		currentName = text ?? ""
	}
}
