//
//  TabBarModel.swift
//  TestAppNitrix
//
//  Created by Иван on 03.02.2024.
//

import UIKit

final class TabBarBuilder {
    
    static let shared = TabBarBuilder()
    
    private init() {}

    func buildTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        let listTab = ChildViewController()
        let firstBarItem = UITabBarItem(title: "Movies List",
                                         image: UIImage(named: "list.bullet"),
                                         selectedImage: UIImage(named: "list.bullet"))
        listTab.tabBarItem = firstBarItem

        let favoritesTab = FavoritesViewController()
        let secondBarItem = UITabBarItem(title: "Favorites",
                                          image: UIImage(named: "favorites"),
                                          selectedImage: UIImage(named: "favorites"))
        favoritesTab.tabBarItem = secondBarItem

        tabBarController.viewControllers = [listTab, favoritesTab]
        return tabBarController
    }
}
