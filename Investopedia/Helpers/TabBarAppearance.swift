//
//  TabBarAppearance.swift
//  Investopedia
//
//  Created by João Ponte on 13/10/2023.
//

import UIKit

class TabBarAppearanceHelper {
    
    static func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        
        tabBarAppearance.backgroundColor = .white
        
        let tabBarNormalItemAppearance = UITabBarItemAppearance()
        tabBarNormalItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        tabBarNormalItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        
        tabBarAppearance.stackedLayoutAppearance = tabBarNormalItemAppearance
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
}
