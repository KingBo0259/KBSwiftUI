//
//  SceneDelegate.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/13.
//  Copyright © 2019 金灵波. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
        let setting = KBUserSettings()
        setting.score = 100
        
        let navi = UINavigationBar.appearance()
        navi.barTintColor = UIColor.blue //设置导航蓝背景色
//        navi.tintColor = .white
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView:
            KBMessageChatPage())
        self.window = window
        window.makeKeyAndVisible()
    }

}

