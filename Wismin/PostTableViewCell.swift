//
//  PostTableViewCell.swift
//  Wismin
//
//  Created by Togami Yuki on 2018/10/22.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var goodNum: UILabel!
    @IBOutlet weak var sendNum: UILabel!
    
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var wiseSaying: UILabel!
    @IBOutlet weak var poster: UILabel!
    
    @IBOutlet weak var good: UIButton!
    @IBOutlet weak var send: UIButton!
    @IBOutlet weak var share: UIButton!
    
    
    @IBAction func inspireBtn(_ sender: UIButton) {
        //自分のフォロワーリストが表示され「名言」を送信する。
        print("memo:名言を送る")
    }
    
    @IBAction func shareBtn(_ sender: UIButton) {
        print("memo:他のSNSでシェアする")
    }
    
    @IBAction func goodBtn(_ sender: UIButton) {
        //いいねの画像を変更し、数字を増やす。いいねリストに追加する。
        print("memo:いいねする")
    }
    
    
    //セルが読み込まれた後?に動作する。
    override func awakeFromNib() {
        super.awakeFromNib()
        print("memo:awakeFromNib関数")
        
        let screenWidth = UIScreen.main.bounds.size.width
        let btnsize = screenWidth * 0.08
        
        //背景画像のレイアウト
        backImage.frame = CGRect(x: 0, y: 0, width: screenWidth, height: self.frame.size.width)
        backImage.contentMode = UIViewContentMode.scaleAspectFill
        backImage.layer.cornerRadius = 15
        backImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //ユーザー画像
        userImage.frame = CGRect(x: 9, y: backImage.frame.size.height - userImage.frame.size.height/2, width: self.frame.size.width * 0.2, height: self.frame.size.width * 0.2)
        userImage.layer.cornerRadius = userImage.frame.size.width * 0.5
        self.addSubview(userImage)
        
        //postDate
        postDate.frame = CGRect(x: screenWidth - 129, y: 3, width: 120, height: 15)
        self.addSubview(postDate)
        
        //wiseSaying
        wiseSaying.center = backImage.center
        
        //poster
        poster.frame = CGRect(x: self.frame.size.width * 0.2 + 18, y:self.frame.size.width - 36, width: screenWidth - (self.frame.size.width * 0.2 + 27), height: 30)
        
        //Good画像について
        let goodX = 18 + userImage.frame.size.width
        good.frame = CGRect(x: goodX, y: backImage.frame.size.height + 6, width: btnsize, height: btnsize)
        self.addSubview(good)
        
        
        //Goodの数字
        goodNum.frame = CGRect(x: Int(18 + userImage.frame.size.width + btnsize + 3), y: 369 - 27, width: 50, height: 15)
        self.addSubview(goodNum)
        
        //Send画像について
        send.frame = CGRect(x: screenWidth/2, y: backImage.frame.size.height + 6, width: btnsize, height: btnsize)
        self.addSubview(send)
        
        //Sendの数字
        sendNum.frame = CGRect(x: Int(screenWidth/2 + btnsize + 3), y: 369 - 27, width: 50, height: 15)
        
        //Share画像について
        share.frame = CGRect(x: screenWidth - screenWidth * 0.08 - 9, y: backImage.frame.size.height + 6, width: btnsize, height: btnsize)
        self.addSubview(share)
        
        
    }

    //画面上にセルが押されるたびに動作する。
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("memo:setSelected関数")
    }
    
}
