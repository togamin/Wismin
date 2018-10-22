//
//  AllPostTableViewController.swift
//  Wismin
//
//  Created by Togami Yuki on 2018/10/22.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class AllPostTableViewController: UITableViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
