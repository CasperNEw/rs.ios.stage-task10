//
//  NewGamePlayerCell.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 27.08.2021.
//

import UIKit

protocol NewGamePlayerCellDelegate: AnyObject {
    func actionButtonTapped(with state: NewGamePlayerCell.State)
}

class NewGamePlayerCell: UITableViewCell {

    // MARK: - Types
    enum State: Equatable {

        static func == (lhs: NewGamePlayerCell.State, rhs: NewGamePlayerCell.State) -> Bool {
             lhs.player == rhs.player
        }

        case addPlayer
        case player(_ player: Player)

        var player: Player? {
            switch self {
            case .addPlayer:
                return nil
            case .player(let player):
                return player
            }
        }

        init(player: Player) {
            self = .player(player)
        }
    }

    // MARK: - Properties
    static let identifier = String(describing: NewGamePlayerCell.self)
    static let height = Constants.iconSide + 2 * Constants.space

    private let actionButton = UIButton()

    private let titleLabel = UILabel(text: "",
                                     font: .nunito(style: .bold, size: 20),
                                     textColor: .white,
                                     numberOfLines: 1,
                                     textAlignment: .left)

    weak var delegate: NewGamePlayerCellDelegate?
    var state: State = .addPlayer

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
        actionButton.setImage(nil, for: .normal)
    }

    // MARK: - Public function
    public func configure(with state: State) {

        self.state = state
        switch state {
        case .addPlayer:
            actionButton.setImage(UIImage.Game.add, for: .normal)
            titleLabel.font = .nunito(style: .regular, size: 20)
            titleLabel.textColor = UIColor.Game.mint
            titleLabel.text = "Add player"
        case .player(let player):
            actionButton.setImage(UIImage.Game.delete, for: .normal)
            titleLabel.font = .nunito(style: .extraBolt, size: 20)
            titleLabel.textColor = .white
            titleLabel.text = player.name
        }
    }

    // MARK: - Module functions
    private func setupViews() {

        contentView.addSubviews(actionButton, titleLabel)
        titleLabel.adjustsFontSizeToFitWidth = false
        backgroundColor = UIColor.Game.gray
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        setupConstraints()
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            actionButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.space),
            actionButton.widthAnchor.constraint(equalToConstant: Constants.iconSide),
            actionButton.heightAnchor.constraint(equalToConstant: Constants.iconSide),
            actionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            titleLabel.leftAnchor.constraint(equalTo: actionButton.rightAnchor, constant: Constants.space),
            titleLabel.centerYAnchor.constraint(equalTo: actionButton.centerYAnchor)
        ])
    }

    // MARK: - Actions
    @objc private func actionButtonTapped() {
        delegate?.actionButtonTapped(with: state)
    }
}
