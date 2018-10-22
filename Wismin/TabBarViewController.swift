//
//  TabBarViewController.swift
//  Wismin
//
//  Created by Togami Yuki on 2018/10/22.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //アイコン色
        UITabBar.appearance().tintColor = .white
        //背景色
        UITabBar.appearance().barTintColor = UIColor(red: 9/255, green: 0, blue: 54/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
