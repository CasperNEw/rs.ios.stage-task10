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

    override func viewDidLoad() { }
}

// MARK: - NewGameViewDelegate
extension NewGameViewController: NewGameViewDelegate {

    func addPlayerTapped() {
        // todo
    }

    func startButtonTapped() {
        // todo
    }
}
