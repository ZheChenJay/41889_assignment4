//
//  TabBarControlerView.swift
//  Ios_ass4
//
//  Created by LongleiGuo on 2022/5/15.
//

import UIKit

class TabBarControler: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = ProductListVC()
        vc.title = "Home"
        vc.tabBarItem.image = UIImage(systemName: "house")
        vc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let nc = UINavigationController(rootViewController: vc)
        
        let vc2 = ProductCollectListVC()
        vc2.title = "Favorite"
        vc2.tabBarItem.image = UIImage(systemName: "heart")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "herat fill")
        
        let nc2 = UINavigationController(rootViewController: vc2)
        
        viewControllers = [nc,nc2]
        
        delegate = self
    }


}

extension TabBarControler: UITabBarControllerDelegate {
    func tabBarController(_ TabBarControler: UITabBarController, didSelect viewController: UIViewController){
       if let nc = viewController as? UINavigationController,
          let vc = nc.viewControllers.first as? ProductCollectListVC{
           vc.refreshData()
       }
    }
}
