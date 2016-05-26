//
//  MainViewController.swift
//  IOSDP
//
//  Created by Andy on 5/27/16.
//  Copyright (c) 2016 Mot. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var bar  = self.tabBar
        if(bar.items?.count>=3){
            var statusBar = bar.items![0] as UITabBarItem
            var deplyBar = bar.items![1] as UITabBarItem
            var settingBar = bar.items![2] as UITabBarItem
            
            let monitorPic = UIImage(named:"monitor_focus.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            statusBar.selectedImage=monitorPic
            //chatBar.image=chatPic
            
            let consolePic = UIImage(named: "console_focus.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            deplyBar.selectedImage=consolePic
            
            let cpreferencePic = UIImage(named: "preferences_focus.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            settingBar.selectedImage=cpreferencePic
        }

        // Do any additional setup after loading the view.
    }

    
}
