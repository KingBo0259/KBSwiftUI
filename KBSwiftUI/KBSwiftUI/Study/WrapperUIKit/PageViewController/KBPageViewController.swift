//
//  KBPageViewController.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/25.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBPageViewController : UIViewControllerRepresentable {
    var controllers:[UIViewController]
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers(controllers, direction: .forward, animated: true)
    }
  
   
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return pageViewController
    }
    
    
}


