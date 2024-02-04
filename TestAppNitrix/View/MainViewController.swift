//
//  ChildViewController.swift
//  TestAppNitrix
//
//  Created by Иван on 02.02.2024.
//

import UIKit

final class MainViewController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = TabBarBuilder.shared.buildTabBarController().viewControllers
    }
}

