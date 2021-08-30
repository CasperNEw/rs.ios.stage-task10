//
//  NewGameView.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 26.08.2021.
//

import UIKit

protocol NewGameViewDelegate: AnyObject {
    func startButtonTapped()
    func addPlayerTapped()
}

final class NewGameView: UIView {

    // MARK: - Properties
    private let mainLabel = UILabel(text: "Game Counter",
                                    font: .nunito(style: .extraBolt, size: 36),
                                    textColor: .white,
                                    numberOfLines: 1,
                                    textAlignment: .left)

    private let tableView = SelfSizingTableView(frame: .zero, style: .plain)

    private let startButton = PushButton(image: UIImage.Game.button,
                                         transformScale: 0.9)

    weak var delegate: NewGameViewDelegate?
    weak var viewModel: NewGameViewModelProtocol? {
        didSet {
			updateDataSource()
			bindViewModel()
		}
    }

    private var didSetupConstraints = false
    private var dataSource: [NewGamePlayerCell.State] = [.addPlayer] {
        didSet {
			startButton.isEnabled = !(dataSource.count == 1)
            viewModel?.updatePlayers(dataSource.compactMap({ $0.player }))
        }
    }

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
    private func updateDataSource() {
        var array: [NewGamePlayerCell.State] = viewModel?.getPlayers().map { .player($0) } ?? []
        array.append(.addPlayer)
        dataSource = array
    }

	private func bindViewModel() {
		viewModel?.playersDidChange = { [weak self] in
			self?.updateDataSource()
			self?.tableView.reloadData()
		}
	}

    private func setupViews() {

        addSubviews(mainLabel, tableView, startButton)
        backgroundColor = UIColor.Game.black

        tableView.backgroundColor = UIColor.Game.gray
        tableView.register(NewGamePlayerCell.self, forCellReuseIdentifier: NewGamePlayerCell.identifier)
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = NewGamePlayerCell.height
        tableView.layer.cornerRadius = 15
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.Game.separator
        tableView.isEditing = true

        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        setNeedsUpdateConstraints()
    }

    private func setupConstraints() {
        let bottomInset = (Constants.bottomInset - safeAreaInsets.bottom).mirror

        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.topInset),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sideInset),
            mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.sideInset.mirror),

            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sideInset),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.sideInset.mirror),
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: bottomInset),
            startButton.heightAnchor.constraint(equalToConstant: Constants.bottomInset),

            tableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.space25),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sideInset),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.sideInset.mirror),
            tableView.bottomAnchor.constraint(lessThanOrEqualTo: startButton.topAnchor, constant: Constants.bottomInset.mirror)
        ])
    }

    // MARK: - Actions
    @objc private func startButtonTapped() {
        delegate?.startButtonTapped()
    }
}

// MARK: - UITableView
extension NewGameView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        createHeaderView()
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView(frame: .zero)
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .zero
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        switch dataSource[indexPath.row] {
        case .addPlayer: return false
        case .player: return true
        }
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch dataSource[indexPath.row] {
        case .addPlayer: cell.reorderControlImageView?.tint(color: .clear)
        case .player: cell.reorderControlImageView?.tint(color: .white)
        }
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataSource.swapAt(sourceIndexPath.row, destinationIndexPath.row)

        if dataSource.last != .addPlayer {
            dataSource.swapAt(sourceIndexPath.row, destinationIndexPath.row)
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: NewGamePlayerCell.identifier, for: indexPath) as? NewGamePlayerCell
        else { fatalError("dequeueReusableCell error") }

        cell.configure(with: dataSource[indexPath.row])
        cell.delegate = self
        return cell
    }

    private func createHeaderView() -> UIView {

        let view = UIView()
        view.backgroundColor = UIColor.Game.gray

        let label = UILabel(text: "Players",
                            font: .nunito(style: .regular, size: 16),
                            textColor: UIColor.Game.lightGray,
                            numberOfLines: 1,
                            textAlignment: .left)

        view.addSubviews(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.sideInset),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.sideInset),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.sideInset.mirror),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        return view
    }
}

// MARK: - NewGamePlayerCellDelegate
extension NewGameView: NewGamePlayerCellDelegate {

    func actionButtonTapped(with state: NewGamePlayerCell.State) {
        switch state {
        case .addPlayer:
            delegate?.addPlayerTapped()
        case .player:
            guard let index = dataSource.firstIndex(of: state) else { return }
            dataSource.remove(at: index)
			tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        }
    }
}
