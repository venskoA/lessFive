//
//  NavigationController.swift
//  courseFiveLessonFiveComposite
//
//  Created by Andrey Vensko on 20.04.22.
//

import Foundation
import UIKit

class NavigationController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createVC()
    }

    /// create first VC and NavigationController
    func createVC() {
        let firstController = ViewController()
        let navController = UINavigationController(rootViewController: firstController)
        viewControllers = [navController]
    }
}
