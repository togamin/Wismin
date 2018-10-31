//
//  TabBarViewController.swift
//  Wismin
//
//  Created by Togami Yuki on 2018/10/22.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import YPImagePicker

class TabBarViewController: UITabBarController {

    var sendPhoto:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //アイコン色
        UITabBar.appearance().tintColor = .white
        //背景色
        UITabBar.appearance().barTintColor = colorArray[designNum]
        
        YPImagePickerConfig()
    }
    

    //投稿作成用のライブラリ等表示
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1{
            let picker = YPImagePicker()
            picker.didFinishPicking { [unowned picker] items, cancelled in
                for item in items {
                    switch item {
                    case .photo(let photo):
                        print("phote",photo.image)
                        self.sendPhoto = photo.image
                    case .video(let video):
                        print("video",video)
                    }
                }
                if cancelled {
                    //「Cancel」ボタンが押された時の処理
                    print("memo:「Cancel」ボタン")
                    //ピッカーを消す
                    picker.dismiss(animated: true, completion: nil)
                    
                    //タグ番目の画面に遷移する
                    self.selectedIndex = 0
                }else{
                    //「Next」ボタンが押された時の処理
                    print("memo:「Next」ボタン")
                    let storyboard = UIStoryboard(name: "makePost", bundle: nil)
                    let makePostViewController = storyboard.instantiateViewController(withIdentifier:"makePostViewController") as! makePostViewController
                    makePostViewController.getPhoto = self.sendPhoto
                    picker.pushViewController(makePostViewController, animated: true)
                }
            }
            present(picker, animated: true, completion: nil)
        }
    }
    
    //インスタ風ImagePickerの設定
    func YPImagePickerConfig(){
        var config = YPImagePickerConfiguration()
        //ライブラリの写真を表示する際、1行に何枚写真を並べるか。
        config.library.numberOfItemsInRow = 5
        //どのスクリーンを最初に表示するか。
        config.startOnScreen = .library
        //ステータスバーを隠すかどうか
        config.hidesStatusBar = false
        //ナビゲーションの右側のボタン「Next」
        config.colors.tintColor = .white
        //写真を正方形にする
        config.library.onlySquare  = true
        //上記設定
        YPImagePickerConfiguration.shared = config
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
