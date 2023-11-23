//
//  TabController.swift
//  modular
//
//  Created by Levan Loladze on 23.11.23.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
    }
    
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeViewController())
        let breeds = self.createNav(with: "Breeds", and: UIImage(systemName: "dog"), vc: BreedsViewController())
        
        self.setViewControllers([home, breeds], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
//        nav.viewControllers.first?.navigationItem.title = title + " Controller"

        return nav
    }
}
