//
//  makePostViewController.swift
//  Wismin
//
//  Created by Togami Yuki on 2018/10/27.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import DPPickerManager

class makePostViewController: UIViewController,UITabBarDelegate {

    var getPhoto:UIImage!
    var postImageView:UIImageView!
    
    @IBOutlet weak var InspireTextView: UITextView!
    @IBOutlet weak var addTextBtn: UIButton!
    @IBOutlet weak var upFontBtn: UIButton!
    @IBOutlet weak var downFontBtn: UIButton!
    @IBOutlet weak var viewDesign01: UIView!
    @IBOutlet weak var viewDesign02: UIView!
    @IBOutlet weak var fontChange: UIButton!
    var fontLabel:UILabel!
    
    
    //スクリーンのサイズを入れる変数
    var screenWidth:CGFloat!
    var screenHeight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクリーンのサイズ取得
        screenWidth = UIScreen.main.bounds.size.width
        screenHeight = UIScreen.main.bounds.size.height
        
        // UIScrollViewインスタンス生成
        var scrollView = UIScrollView()
        
        // UIScrollViewのサイズと位置を設定
        scrollView.frame.size =
            CGSize(width: screenWidth, height: screenHeight)
        scrollView.center = self.view.center
        
        print("memo:getPhoto",getPhoto)
        
        if getPhoto != nil {
            
            //高さの指定
            let InspireTextViewHeight:CGFloat = 90
            let addTextBtnHeight:CGFloat = 30
            let addTextBtnWidth:CGFloat = 90
            let height01:CGFloat = 30
            let height02:CGFloat = 30
            let fontSizeLabelWidth:CGFloat = 90
            let fontBtnWidth:CGFloat = 60
            
            
            //選択した写真を表示するUIImageView
            postImageView = UIImageView()
            postImageView.frame = CGRect(x: 0, y: 0, width:screenWidth , height: screenWidth)
            postImageView.image = getPhoto
            postImageView.contentMode = .scaleAspectFill
            scrollView.addSubview(postImageView)
            
            //UITextView等入れるView
            viewDesign01.backgroundColor = UIColor.lightGray
            viewDesign01.layer.cornerRadius = 5
            viewDesign01.frame = CGRect(x: 10, y: screenWidth + 10, width: screenWidth - 20, height: InspireTextViewHeight + addTextBtnHeight + 25)
            scrollView.addSubview(viewDesign01)
            
            //文字を入力するUITextView
            InspireTextView.layer.cornerRadius = 5
            InspireTextView.frame = CGRect(x:10, y:10, width: viewDesign01.frame.size.width - 20, height: InspireTextViewHeight)
            viewDesign01.addSubview(InspireTextView)
            
            //文字を追加するボタン
            addTextBtn.text("Add")
            addTextBtn.tintColor = .white
            addTextBtn.backgroundColor = colorArray[designNum]
            addTextBtn.layer.cornerRadius = 5
            addTextBtn.frame = CGRect(x:viewDesign01.frame.size.width - addTextBtnWidth - 10, y: InspireTextViewHeight + 15, width: addTextBtnWidth, height: addTextBtnHeight)
            viewDesign01.addSubview(addTextBtn)
            
            let underAddY = screenWidth + 20 + viewDesign01.frame.size.height
            
            //デザインボード
            viewDesign02.backgroundColor = UIColor.lightGray
            viewDesign02.layer.cornerRadius = 5
            viewDesign02.frame = CGRect(x: 10, y: underAddY, width: screenWidth - 20, height: height02*2 + 30)
            scrollView.addSubview(viewDesign02)
            
            //Font選択
            let fontSelectLabel = UILabel()
            fontSelectLabel.text = "Font    :"
            fontSelectLabel.textColor = .white
            fontSelectLabel.frame = CGRect(x: 10, y: 10, width: fontSizeLabelWidth, height: height02)
            viewDesign02.addSubview(fontSelectLabel)
            
            //FontLabel
            fontLabel = UILabel()
            fontLabel.text = "Please Select."
            fontLabel.backgroundColor = .white
            fontLabel.font = UIFont.systemFont(ofSize: 13)
            fontLabel.layer.cornerRadius = 5
            fontLabel.frame = CGRect(x: fontSizeLabelWidth + 10, y: 10, width: viewDesign02.frame.size.width - 25 - fontSizeLabelWidth - fontBtnWidth, height: height02)
            viewDesign02.addSubview(fontLabel)
            
            //Font変更用ボタン
            fontChange.layer.cornerRadius = 5
            fontChange.frame = CGRect(x: viewDesign02.frame.size.width - fontBtnWidth - 10, y: 10, width: fontBtnWidth, height: height02)
            fontChange.backgroundColor = colorArray[designNum]
            fontChange.setImage(UIImage(named: "fontIcon.png"), for: .normal)
            fontChange.imageView?.contentMode = .scaleAspectFit
            fontChange.tintColor = .white
            viewDesign02.addSubview(fontChange)
            
            
            //「fontsize」ラベル
            let fontSizeLabel = UILabel()
            fontSizeLabel.text = "Font Size :"
            fontSizeLabel.textColor = .white
            fontSizeLabel.frame = CGRect(x: 10, y: height02 + 20, width: fontSizeLabelWidth, height: height02)
            viewDesign02.addSubview(fontSizeLabel)
            
            //フォントサイズ変更するボタンの幅
            let fontSizeBtnWidth = (viewDesign02.frame.size.width - fontSizeLabelWidth - 30)/2
            
            //文字サイズ変更用のボタン
            //up
            upFontBtn.frame = CGRect(x: fontSizeLabelWidth + 10, y:height02 + 20, width: fontSizeBtnWidth, height: height02)
            upFontBtn.backgroundColor = colorArray[designNum]
            upFontBtn.layer.cornerRadius = 5
            upFontBtn.setImage(UIImage(named: "upFont.png"), for: .normal)
            upFontBtn.imageView?.contentMode = .scaleAspectFit
            upFontBtn.tintColor = .white
            viewDesign02.addSubview(upFontBtn)
            //down
            downFontBtn.frame = CGRect(x: fontSizeLabelWidth + 20 + fontSizeBtnWidth, y: height02 + 20, width: fontSizeBtnWidth, height: height02)
            downFontBtn.backgroundColor = colorArray[designNum]
            downFontBtn.layer.cornerRadius = 5
            downFontBtn.setImage(UIImage(named: "downFont.png"), for: .normal)
            downFontBtn.imageView?.contentMode = .scaleAspectFit
            downFontBtn.tintColor = .white
            viewDesign02.addSubview(downFontBtn)
            
            
        }
        
        // UIScrollViewのコンテンツのサイズを指定
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight*2)
        
        // ビューに追加
        self.view.addSubview(scrollView)
        //キーボードに「Done」を表示
        keyBoardDone()
    }
    
    //ボタンを押すとTextViewの情報を画像の上へ
    @IBAction func addTextBtn(_ sender: UIButton) {
        print("ラベル追加")
        let InspireLabel = UILabel()
        let InspireLabelWidth = screenWidth - 40
        InspireLabel.textAlignment = .center
        InspireLabel.numberOfLines = 0
        InspireLabel.textColor = UIColor.white
        InspireLabel.font = UIFont.italicSystemFont(ofSize: 36)
        //InspireLabel.center = postImageView.center
        InspireLabel.frame = CGRect(x: postImageView.center.x - InspireLabelWidth/2, y: postImageView.center.y - InspireLabelWidth/2, width: InspireLabelWidth, height: InspireLabelWidth)
        InspireLabel.text = InspireTextView.text
        postImageView.addSubview(InspireLabel)
    }
    //Font変更用ボタン
    @IBAction func fontChange(_ sender: UIButton) {
        print("memo:Picker起動")
        let fontName = ["Zapfino","DBLCDTempBlack","MarkerFelt-Thin","AppleSDGothicNeo-Regular"]
        DPPickerManager.shared.showPicker(title: "Strings Picker", selected: "Value 1", strings: fontName) { (value, index, cancel) in
            if !cancel {
                // TODO: you code here
                self.fontLabel.text = value!
                self.fontLabel.font = UIFont(name: value!, size: 13)
            }
        }
        print("memo:Picker起動完了")
    }
    
    
    //文字のサイズ変更用のボタン
    @IBAction func upFontSize(_ sender: UIButton) {
        
    }
    @IBAction func downFontSize(_ sender: UIButton) {
        
    }
    
    
    @IBAction func postBtn(_ sender: UIBarButtonItem) {
        print("memo:投稿します")
        //Firestoreに保存する処理
        //・・・
        
        //画面遷移
        self.dismiss(animated: true, completion: nil)
        print("memo:投稿しました")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//UILabelの文字のデザインに関する処理
extension makePostViewController{
    func moziDesign(){
        
    }
}

//キーボードに関する処理
extension makePostViewController{
    func keyBoardDone(){
        // 仮のサイズでツールバー生成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action:#selector(self.closeKeybord(_:)))
        kbToolBar.items = [spacer, commitButton]
        self.InspireTextView.inputAccessoryView = kbToolBar
    }
    @objc func closeKeybord(_ sender:Any){
        self.view.endEditing(true)
    }
}

