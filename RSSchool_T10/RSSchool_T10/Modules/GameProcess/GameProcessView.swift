//
//  GameProcessView.swift
//  RSSchool_T10
//
//  Created by 19046471 on 30.08.2021.
//

import UIKit

protocol GameProcessViewDelegate: AnyObject {

}

final class GameProcessView: UIView {

	// MARK: - Properties
	private let mainLabel = UILabel(text: "Game",
									font: .nunito(style: .extraBolt, size: 36),
									textColor: .white,
									numberOfLines: 1,
									textAlignment: .left)

	private let diceButton = PushButton(image: UIImage.Game.dice)

	private let timerLabel = UILabel(text: "00:00",
									 font: .nunito(style: .extraBolt, size: 28),
									 textColor: .white,
									 numberOfLines: 1,
									 textAlignment: .center)

	private let playPauseButton = PushButton(image: UIImage.Game.play)

	private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

	private let buttonsStackViewFirst = UIStackView()
	private let previousButton = PushButton(image: UIImage.Game.previous)
	private let nextButton = PushButton(image: UIImage.Game.next)
	private let plusOneButton = PushButton(image: UIImage.Game.plusOne)

	private let buttonsStackViewSecond = UIStackView()
	private let minusTenButton = PushButton(image: UIImage.Game.minusTen)
	private let minusFiveButton = PushButton(image: UIImage.Game.minusFive)
	private let minusOneButton = PushButton(image: UIImage.Game.minusOne)
	private let plusFiveButton = PushButton(image: UIImage.Game.plusFive)
	private let plusTenButton = PushButton(image: UIImage.Game.plusTen)




	private let undoButton = PushButton(image: UIImage.Game.undo)
	private let labelsStackView = UIStackView()

	weak var delegate: GameProcessViewDelegate?
	private var players: [Player] = []
	private var didSetupConstraints = false

	// MARK: - Initialization
	override init(frame: CGRect) {
		super.init(frame: frame)
//		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public func configure(with players: [Player]) {
		self.players = players
		setupViews()
		setupConstraints()
	}

	// MARK: - Lifecycle
	override func updateConstraints() {
		super.updateConstraints()

		if !didSetupConstraints {
//			setupConstraints()
			didSetupConstraints = true
		}
	}

	// MARK: - Module functions
	private func setupViews() {

		addSubviews(mainLabel, diceButton, timerLabel, playPauseButton,
					collectionView, undoButton, labelsStackView,
					buttonsStackViewFirst, buttonsStackViewSecond)
		backgroundColor = UIColor.Game.black

		[previousButton, plusOneButton, nextButton]
			.forEach({ buttonsStackViewFirst.addArrangedSubview($0) })
		buttonsStackViewFirst.axis = .horizontal
		buttonsStackViewFirst.alignment = .center
		buttonsStackViewFirst.distribution = .fillEqually


	 [minusTenButton, minusFiveButton, minusOneButton, plusFiveButton, plusTenButton]
		.forEach({ buttonsStackViewSecond.addArrangedSubview($0) })
		buttonsStackViewSecond.axis = .horizontal
		buttonsStackViewSecond.alignment = .center
		buttonsStackViewSecond.distribution = .fillEqually

		players.forEach({
			guard let symbol = $0.name.first else { return }
			let label = UILabel(text: String(symbol),
								font: .nunito(style: .extraBolt, size: 20),
								textColor: UIColor.Game.lightGray)
			labelsStackView.addArrangedSubview(label)
		})
		labelsStackView.axis = .horizontal
		labelsStackView.alignment = .center
		labelsStackView.distribution = .equalSpacing
		labelsStackView.spacing = Constants.space5

		setNeedsUpdateConstraints()
	}

	private func setupConstraints() {

		NSLayoutConstraint.activate([
			mainLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.topInset),
			mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sideInset),

			diceButton.heightAnchor.constraint(equalToConstant: Constants.sideButton),
			diceButton.widthAnchor.constraint(equalToConstant: Constants.sideButton),
			diceButton.centerYAnchor.constraint(equalTo: mainLabel.centerYAnchor),
			diceButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.sideInset.mirror),

			timerLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.space30),
			timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

			playPauseButton.leadingAnchor.constraint(equalTo: timerLabel.trailingAnchor, constant: Constants.sideInset),
			playPauseButton.centerYAnchor.constraint(equalTo: timerLabel.centerYAnchor),

			collectionView.topAnchor.constraint(equalTo: playPauseButton.bottomAnchor, constant: Constants.space40),
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),

			undoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.space40),
			undoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.space30.mirror),

			labelsStackView.centerYAnchor.constraint(equalTo: undoButton.centerYAnchor),
			labelsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
			labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.space30),

			buttonsStackViewSecond.bottomAnchor.constraint(equalTo: labelsStackView.topAnchor, constant: Constants.space20),
			buttonsStackViewSecond.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.space10),
			buttonsStackViewSecond.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.space10.mirror),
			buttonsStackViewSecond.heightAnchor.constraint(equalToConstant: Constants.space55),

			buttonsStackViewFirst.bottomAnchor.constraint(equalTo: buttonsStackViewSecond.topAnchor, constant: Constants.space20.mirror),
			buttonsStackViewFirst.leadingAnchor.constraint(equalTo: leadingAnchor),
			buttonsStackViewFirst.trailingAnchor.constraint(equalTo: trailingAnchor),
			buttonsStackViewFirst.heightAnchor.constraint(equalToConstant: Constants.space90),

			collectionView.bottomAnchor.constraint(equalTo: buttonsStackViewFirst.topAnchor, constant: Constants.space30.mirror)
		])
	}
}
