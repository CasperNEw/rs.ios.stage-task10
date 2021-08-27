//
//  AddPlayerView.swift
//  RSSchool_T10
//
//  Created by 19046471 on 30.08.2021.
//

import UIKit

protocol AddPlayerViewDelegate: AnyObject {

	func didChangeText(_ text: String?)
}

final class AddPlayerView: UIView {

	// MARK: - Properties
	private let mainLabel = UILabel(text: "Add Player",
									font: .nunito(style: .extraBolt, size: 36),
									textColor: .white,
									numberOfLines: 1,
									textAlignment: .left)

	private let backgroundTextFieldView = UIView()
	private let textField = UITextField()

	weak var delegate: AddPlayerViewDelegate?
	private var didSetupConstraints = false

	// MARK: - Initialization
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func updateConstraints() {
		super.updateConstraints()

		if !didSetupConstraints {
			setupConstraints()
			didSetupConstraints = true
		}
	}

	// MARK: - Module functions
	private func setupViews() {

		addSubviews(mainLabel, backgroundTextFieldView, textField)
		backgroundColor = UIColor.Game.black
		backgroundTextFieldView.backgroundColor = UIColor.Game.gray
		textField.delegate = self
		textField.font = UIFont.nunito(style: .extraBolt, size: 20)
		textField.textColor = UIColor.Game.lightGray

		textField.attributedPlaceholder = NSAttributedString(string: "Player Name",
															 attributes: [NSAttributedString.Key.foregroundColor: UIColor.Game.lightGray])

		setNeedsUpdateConstraints()
	}

	private func setupConstraints() {

		NSLayoutConstraint.activate([
			mainLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.topInset),
			mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sideInset),
			mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.sideInset.mirror),

			backgroundTextFieldView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.space),
			backgroundTextFieldView.leadingAnchor.constraint(equalTo: leadingAnchor),
			backgroundTextFieldView.trailingAnchor.constraint(equalTo: trailingAnchor),
			backgroundTextFieldView.heightAnchor.constraint(equalToConstant: Constants.defaultHeight),

			textField.leadingAnchor.constraint(equalTo: backgroundTextFieldView.leadingAnchor, constant: Constants.space),
			textField.trailingAnchor.constraint(equalTo: backgroundTextFieldView.trailingAnchor, constant: Constants.space.mirror),
			textField.bottomAnchor.constraint(equalTo: backgroundTextFieldView.bottomAnchor),
			textField.topAnchor.constraint(equalTo: backgroundTextFieldView.topAnchor)
		])
	}
}

// MARK: - UITextFieldDelegate
extension AddPlayerView: UITextFieldDelegate {

	func textFieldDidChangeSelection(_ textField: UITextField) {
		delegate?.didChangeText(textField.text)
	}
}
