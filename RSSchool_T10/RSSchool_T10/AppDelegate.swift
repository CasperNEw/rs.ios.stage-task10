//
//  AppDelegate.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 26.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
		let controller = NewGameViewController()
		let navigationController = UINavigationController(rootViewController: controller)
		window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

		setupAppearance()

        return true
    }

	private func setupAppearance() {
		guard let barButtonItemFont = UIFont.nunito(style: .extraBolt, size: 17)
		else { return }

		UIBarButtonItem
			.appearance()
			.setTitleTextAttributes(
				[NSAttributedString.Key.font: barButtonItemFont,
				 NSAttributedString.Key.foregroundColor: UIColor.Game.mint,], for: .normal)

		UINavigationBar.appearance().barTintColor = UIColor.Game.black
		UINavigationBar.appearance().tintColor = UIColor.Game.black
		UINavigationBar.appearance().isTranslucent = false

		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().backIndicatorImage = UIImage()

		UITextField.appearance().tintColor = UIColor.Game.lightGray
	}
}

