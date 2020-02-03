//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by Victor Hugo on 19/01/20.
//  Copyright © 2020 Vintage Robot. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Al prinicipio se utiliza un UIViewController como argumento para ir creando la app, pero
        // a medida que se va creando cada una de las clases que se van a usar se va cambiando el argumento que se entrega a createNavController
        
        viewControllers = [
        createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
        createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
        createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search")]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController
    {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
    
}

