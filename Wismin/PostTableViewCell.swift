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
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var wiseSaying: UILabel!
    @IBOutlet weak var poster: UILabel!
    
    
    
    
    @IBAction func inspireBtn(_ sender: UIButton) {
        //自分のフォロワーリストが表示され「名言」を送信する。
        print("memo:名言を送る")
    }
    
    @IBAction func shareBtn(_ sender: UIButton) {
        print("memo:他のSNSでシェアする")
    }
    
    @IBAction func goodBtn(_ sender: UIButton) {
        //いいねの画像を変更し、数字を増やす。いいねリストに追加する。
        print("いいねする")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("memo:awakeFromNib関数")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("memo:setSelected関数")
    }
    
}
