//
//  AllPostTableViewController.swift
//  Wismin
//
//  Created by Togami Yuki on 2018/10/22.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

var defaultColor:UIColor = UIColor(red: 9/255, green: 0, blue: 54/255, alpha: 0.8)

class AllPostTableViewController: UITableViewController {

    var postData:[String:Any]!
    var postDataList:[[String:Any]]!
    
    @IBOutlet var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //サンプルデータ
        postData = ["userImage":"Wismintest02.jpg","postDate":"2018/10/22","goodNum":"100","sendNum":"150","backImage":"backImage.jpg","wiseSaying":"You look perfect tonight.","poster":"togaminnnn"]
        postDataList = [postData,postData,postData]
        
        //xibファイルの設定
        let nib = UINib(nibName:"PostTableViewCell",bundle:nil)
        postTableView.register(nib, forCellReuseIdentifier: "postCell")
        postTableView.estimatedRowHeight = 250
        postTableView.rowHeight = UITableViewAutomaticDimension//自動的にセルの高さを調節する
        
        //view.backgroundColor = viewColor
        
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
    
    //セクションの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return postDataList.count
    }


    //セルの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1//postDataList.count
    }
    
    //セルの高さ
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 369
    }
    // セルの上部のスペース.一番上のやつだけなしにする処理が必要。
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    // セルの下部のスペース.一番下のやつだけなしにする処理が必要。
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    

    //セルのインスタンス化
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell

        cell.userImage.image = UIImage(named: postDataList[indexPath.section]["userImage"] as! String)
        cell.postDate.text = postDataList[indexPath.section]["postDate"] as! String
        cell.goodNum.text = postDataList[indexPath.section]["goodNum"] as! String
        cell.sendNum.text = postDataList[indexPath.section]["sendNum"] as! String
        cell.backImage.image = UIImage(named: postDataList[indexPath.section]["backImage"] as! String)
        cell.wiseSaying.text = postDataList[indexPath.section]["wiseSaying"] as! String
        
        var posterStr = postDataList[indexPath.section]["poster"] as! String
        cell.poster.text = "by" + " " + posterStr
        
        //セルのレイアウト
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        cell.layer.borderColor = defaultColor.cgColor
        // 影の設定
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowRadius = 9
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
        

        
        return cell
    }
}
