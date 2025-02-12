//
//  AppDelegate.swift
//  Prototype
//
//  Created by Joanne  Park  on 1/11/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var application: UIApplication?
    
    @objc var currentUnityController: UnityAppController!
    
    var isUnityRunning = false
    var isUnityResignActive = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.application = application
        unity_init(CommandLine.argc, CommandLine.unsafeArgv)
        
        currentUnityController = UnityAppController()
        currentUnityController.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // first call to startUnity will do some init stuff, so just call it here and directly stop it again
        /*startUnity()
        stopUnity()*/
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        if isUnityRunning {
            currentUnityController.applicationWillResignActive(application)
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        if isUnityRunning {
            currentUnityController.applicationDidEnterBackground(application)
        }
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
        if isUnityRunning {
            currentUnityController.applicationWillEnterForeground(application)
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        if isUnityRunning {
            currentUnityController.applicationDidBecomeActive(application)
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func startUnity() {
        if !isUnityRunning
        {
            isUnityRunning = true
            currentUnityController.applicationDidBecomeActive(application!)
        }
    }
    
    func stopUnity() {
        if isUnityRunning {
            currentUnityController.applicationWillResignActive(application!)
            isUnityRunning = false
            isUnityResignActive = true
        }
    }
    
    
}

