//
//  AppDelegate.swift
//  Wismin
//
//  Created by Togami Yuki on 2018/10/19.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Firebaseの初期設定
        FirebaseApp.configure()
        //TwitterKitの初期設定
        TWTRTwitter.sharedInstance().start(withConsumerKey:"", consumerSecret:"")
        
        //ナビゲーションの背景色変更
        UINavigationBar.appearance().barTintColor = UIColor(red: 9/255, green: 0, blue: 54/255, alpha: 1.0)
        //ナビゲーションタイトル色変更
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        //ナビゲーションアイテムの色を変更
        UINavigationBar.appearance().tintColor = .white
        
        return true
    }
    
    //登録したURLスキームのURLを開き、サインインに関する情報を受け取る。
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {

            print("memo:テスト１")
            if GIDSignIn.sharedInstance().handle(url,sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,annotation: [:]){
                print("memo:googleサインイン")
                return true
            }
            
            if TWTRTwitter.sharedInstance().application(application, open: url, options: options) {
                print("memo:Twitterサインイン")
                return true
            }
            print("memo:テスト２")
            return false
    }

    
    

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}


}

