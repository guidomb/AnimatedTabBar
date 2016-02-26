//
//  TabBarController.swift
//  AnimatedTabBar
//
//  Created by Guido Marucci Blas on 2/26/16.
//  Copyright © 2016 guidomb. All rights reserved.
//

import UIKit
import Neon

final class TabBarController: UIViewController {
    
    let tabBarView = UITabBar()
    let containerView = UIView()
    
    let button = UIButton()
    var started = false
    var tabBarItems: [UITabBarItem] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        tabBarItems = [
            UITabBarItem(tabBarSystemItem: .Bookmarks, tag: 0),
            UITabBarItem(tabBarSystemItem: .Contacts, tag: 1),
            UITabBarItem(tabBarSystemItem: .Favorites, tag: 2),
            UITabBarItem(tabBarSystemItem: .More, tag: 3)
        ]
        tabBarView.items = tabBarItems
        view.addSubview(tabBarView)
        
        containerView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(containerView)
        
        button.backgroundColor = UIColor.greenColor()
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.setTitle("start", forState: .Normal)
        button.addTarget(self, action: #selector(buttonPressed), forControlEvents: .TouchUpInside)
        containerView.addSubview(button)
        
        layoutFrames(49.0)
    }
    
    func layoutFrames(tabBarHeight: CGFloat) {
        tabBarView.anchorAndFillEdge(.Bottom, xPad: 0, yPad: 0, otherSize: tabBarHeight)
        containerView.alignAndFill(align: .AboveCentered, relativeTo: tabBarView, padding: 0)
        button.anchorAndFillEdge(.Bottom, xPad: 0, yPad: 0, otherSize: 50)
    }
    
    func buttonPressed() {
        if started {
            button.backgroundColor = UIColor.redColor()
            button.setTitle("stop", forState: .Normal)
            UIView.animateWithDuration(0.25) {
                self.tabBarView.items = self.tabBarItems
                self.layoutFrames(49.0)
            }
        } else {
            button.backgroundColor = UIColor.greenColor()
            button.setTitle("start", forState: .Normal)
            UIView.animateWithDuration(0.25) {
                self.tabBarView.items = []
                self.layoutFrames(0.0)
            }
        }
        started = !started
    }
    
}