//
//  TabBarController.swift
//  Chapter1
//
//  Created by 김영준 on 2023/09/20.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    private lazy var bonusViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var sendMondeyViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "찜", image: UIImage(systemName: "heart"), tag: 1)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var homeViewController: UINavigationController = {
        let viewController = ViewController()
        let tabBarItem = UITabBarItem(title: "배민", image: UIImage(systemName: "house.fill"), tag: 2)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var stockViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "주문내역", image: UIImage(systemName: "doc.text"), tag: 3)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var allViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "my배민", image: UIImage(systemName: "face.smiling"), tag: 4)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [bonusViewController, sendMondeyViewController, homeViewController,  stockViewController, allViewController]
        selectedIndex = 2
        self.configureTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 85
        tabFrame.origin.y = self.view.frame.size.height - 85
        self.tabBar.frame = tabFrame
    }
}

extension TabBarController {
    func configureTabBar() {
        self.tabBar.tintColor = .label
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.backgroundColor = UIColor.systemBackground.cgColor
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.layer.borderWidth = 0.4
    }
}
