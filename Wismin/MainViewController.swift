//
//  MainViewController.swift
//  Wismin
//
//  Created by Togami Yuki on 2018/10/21.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        //ログインが既に完了していたら、ログイン画面には遷移しない。
        if UserDefaults.standard.object(forKey: "check") != nil{
            print("memo:そのまま")
        }else{
            print("memo:login画面へ")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let LoginViewController = storyboard.instantiateViewController(withIdentifier:"login")
            print("memo:",LoginViewController)
            present(LoginViewController, animated: true, completion: nil)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
