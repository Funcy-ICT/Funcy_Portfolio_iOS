//
//  MainTabBarController.swift
//  portfolio-ios
//
//  Created by KaitoKudo on 2021/10/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }

    private func setTabBar() {
        let topViewController = TopViewController()
        topViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        let personalMyPageViewController = PersonalMyPageViewController()
        personalMyPageViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 2)
        let groupMyPageViewController = GroupMyPageViewController()
        groupMyPageViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 3)
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 4)

        let viewControllers = [topViewController, personalMyPageViewController, groupMyPageViewController, settingViewController]
        setViewControllers(viewControllers, animated: false)
    }
}
