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
            var deployBar = bar.items![1] as UITabBarItem
            var settingBar = bar.items![2] as UITabBarItem
            
            let monitorPic = UIImage(named:"monitor.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            let monitorPicUnfocus = UIImage(named:"monitor_nonfocus.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            statusBar.selectedImage=monitorPic
            statusBar.image=monitorPicUnfocus
            //chatBar.image=chatPic
            
            let consolePic = UIImage(named: "console.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            let consolePicUnFocs = UIImage(named: "console_nonfocus.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            deployBar.selectedImage=consolePic
            deployBar.image=consolePicUnFocs
            
            let preferencePic = UIImage(named: "preferences.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            let preferencePicUnFous = UIImage(named: "preferences_nonfocus.png")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            settingBar.selectedImage=preferencePic
            settingBar.image=preferencePicUnFous
        }

        // Do any additional setup after loading the view.
    }

    
}
