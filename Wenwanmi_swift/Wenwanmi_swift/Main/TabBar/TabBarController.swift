//
//  TabBarController.swift
//  Wenwanmi_swift
//
//  Created by YLRS on 2017/11/2.
//  Copyright © 2017年 YLRS. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var items:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createTabBar()
        
        // Do any additional setup after loading the view.
    }
    func createTabBar() {
        
        let imageArray:[String] = ["tabbar_home","tabbar_discover","tabbar_pai","tabbar_products","tabbar_profile"]
        let selectImages:[String] = ["tabbar_home_selected","tabbar_discover_selected","tabbar_pai_selected","tabbar_products_selected","tabbar_profile_selected"]
        
        
        let mainVC        = LF_HomeViewController()
        let mizoneVC      = LF_MiZoneViewController()
        let microAutionVC = LF_MicroAuctionViewController()
        let productVC     = LF_ProductsViewController()
        let myProfileVC   = LF_MyProfileViewController()
        
        let mainNav         = UINavigationController(rootViewController:mainVC)
        mainNav.tabBarItem.title = "首页"
        mainVC.title = "社区"
        
        let mizoneNav       = UINavigationController(rootViewController:mizoneVC)
        mizoneNav.tabBarItem.title = "圈子"
        mizoneVC.title = "圈子"
        
        let microAutionNav  = UINavigationController(rootViewController:microAutionVC)
        microAutionNav.tabBarItem.title = "微拍"
        microAutionVC.title = "拍卖"
        
        let productNav      = UINavigationController(rootViewController:productVC)
        productNav.tabBarItem.title = "市集"
        productVC.title = "市集"
        
        let myProfileNav    = UINavigationController(rootViewController:myProfileVC)
        myProfileNav.tabBarItem.title = "我的"
        myProfileVC.title = "我的"
        
        items = [mainNav,mizoneNav,microAutionNav,productNav,myProfileNav]
        
        for i in 0..<items.count{
            let item:UINavigationController = items[i] as! UINavigationController
            var image:UIImage = UIImage(named:imageArray[i])!
            var selectImage:UIImage = UIImage(named:selectImages[i])!
            
            image = image.withRenderingMode(.alwaysOriginal)
            selectImage = selectImage.withRenderingMode(.alwaysOriginal)
            item.tabBarItem.image = image;
            item.tabBarItem.selectedImage = selectImage;
        }
        
        self.viewControllers = items as? [UIViewController]
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.tintColor = RGBColor(50,50,50)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
