//
//  AppDelegate.swift
//  Background Timer
//
//  Created by Mark Filter on 2/28/18.
//  Copyright © 2018 Mark Filter. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var bgTask: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        var count = 0
        
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer:Timer) in
            count += 1
            print("Timer Count: ", count)
            
            if count >= 10 {
                timer.invalidate()
                self.endBackground()
            }
        }
        
        bgTask = application.beginBackgroundTask(expirationHandler: {
            // this is the code that fires when iOS ends your background task.
            self.endBackground()
        })
    }
    
    func endBackground() {
        UIApplication.shared.endBackgroundTask(bgTask)
        bgTask = UIBackgroundTaskInvalid
        print("endBackgroud Callback Method Fired!")
    }

    
    
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

