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

    var scrollView:UIScrollView!
    var InspireLabel:UILabel!
    
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
    var fontStyle:String!
    var tag:Int!
    var taptag:Int!
    var inspireList:[UILabel] = []
    var touchTag:Int!//タップしたラベルのタグが入る
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    //色初期値
    var r = CGFloat(1.0)
    var g = CGFloat(1.0)
    var b = CGFloat(1.0)
    var a = CGFloat(1.0)
    
    
    
    //スクリーンのサイズを入れる変数
    var screenWidth:CGFloat!
    var screenHeight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //スクリーンのサイズ取得
        screenWidth = UIScreen.main.bounds.size.width
        screenHeight = UIScreen.main.bounds.size.height
        
        // UIScrollViewインスタンス生成
        scrollView = UIScrollView()
        
        // UIScrollViewのサイズと位置を設定
        scrollView.frame =
            CGRect(x:0,y:screenWidth,width: screenWidth, height: screenHeight)
        //scrollView.center = self.view.center
        
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
            postImageView.tag = -1
            postImageView.isUserInteractionEnabled = true
            postImageView.frame = CGRect(x: 0, y: 0, width:screenWidth , height: screenWidth)
            postImageView.image = getPhoto
            postImageView.contentMode = .scaleAspectFill
            view.addSubview(postImageView)
            
            //UITextView等入れるView
            viewDesign01.backgroundColor = UIColor.lightGray
            viewDesign01.layer.cornerRadius = 5
            viewDesign01.frame = CGRect(x: 10, y: 10, width: screenWidth - 20, height: InspireTextViewHeight + addTextBtnHeight + 25)
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
            
            let underAddY = 20 + viewDesign01.frame.size.height
            
            //デザインボード
            viewDesign02.backgroundColor = UIColor.lightGray
            viewDesign02.layer.cornerRadius = 5
            viewDesign02.frame = CGRect(x: 10, y: underAddY, width: screenWidth - 20, height: height02*5 + 45)
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
            
            //文字色変更用スライダー
            redSlider.frame = CGRect(x: fontSizeLabelWidth + 10, y: height02*2 + 30, width: viewDesign02.frame.size.width - 20 - fontSizeLabelWidth, height: height02)
            redSlider.minimumValue = 0
            redSlider.maximumValue = 1
            redSlider.value = 1
            redSlider.tag = 0
            viewDesign02.addSubview(redSlider)
            greenSlider.frame = CGRect(x: fontSizeLabelWidth + 10, y: height02*3 + 35, width: viewDesign02.frame.size.width - 20 - fontSizeLabelWidth, height: height02)
            greenSlider.minimumValue = 0
            greenSlider.maximumValue = 1
            greenSlider.value = 1
            greenSlider.tag = 1
            viewDesign02.addSubview(greenSlider)
            blueSlider.frame = CGRect(x: fontSizeLabelWidth + 10, y: height02*4 + 40, width: viewDesign02.frame.size.width - 20 - fontSizeLabelWidth, height: height02)
            blueSlider.minimumValue = 0
            blueSlider.maximumValue = 1
            blueSlider.value = 1
            blueSlider.tag = 2
            viewDesign02.addSubview(blueSlider)
            
            
        }
        
        // UIScrollViewのコンテンツのサイズを指定
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight*2)
        
        // ビューに追加
        self.view.addSubview(scrollView)
        //キーボードに「Done」を表示
        keyBoardDone()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tag = 0
        print("memo:test")
        NotificationCenter.default.addObserver(self,selector: #selector(self.keyboardWillShow(notification:)),name: NSNotification.Name.UIKeyboardWillShow,object: nil)
        NotificationCenter.default.addObserver(self,selector: #selector(self.keyboardWillHide(notification:)),name: NSNotification.Name.UIKeyboardWillHide,object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name.UIKeyboardWillShow,object: nil)
        NotificationCenter.default.removeObserver(self,name:NSNotification.Name.UIKeyboardWillHide,object: nil)
    }
    
    
    //ボタンを押すとTextViewの情報を画像の上へ
    //Viewを用意する必要があるかどうかの検討
    @IBAction func addTextBtn(_ sender: UIButton) {
        print("ラベル追加")
        InspireLabel = UILabel()
        InspireLabel.tag = tag
        touchTag = tag
        tag = tag + 1
        print("memo:tag",InspireLabel.tag)
        inspireList.append(InspireLabel)
        print("memo:InsporeList",inspireList)
        
        //ジェスチャー機能
        var tapGesture = UITapGestureRecognizer(target: self, action: #selector(makePostViewController.labelTap(_:)))
        var moveGesture = UIPanGestureRecognizer(target: self, action: #selector(makePostViewController.labelMove(_:)))
        InspireLabel.isUserInteractionEnabled = true
        InspireLabel.addGestureRecognizer(tapGesture)
        InspireLabel.addGestureRecognizer(moveGesture)
        
        let InspireLabelWidth = screenWidth - 40
        InspireLabel.textAlignment = .center
        InspireLabel.numberOfLines = 1
        InspireLabel.textColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: a)
        if fontStyle != nil{
            InspireLabel.font = UIFont(name: fontStyle, size: 29)
        }else{
            InspireLabel.font = UIFont.italicSystemFont(ofSize: 29)
        }
        InspireLabel.text = InspireTextView.text
        
        InspireLabel.sizeToFit()
        
        InspireLabel.frame = CGRect(x: postImageView.center.x - InspireLabelWidth/2, y: postImageView.center.y - InspireLabel.frame.size.height, width: InspireLabelWidth, height: InspireLabel.frame.size.height)
        
        postImageView.addSubview(InspireLabel)
    }
    //Font変更用ボタン
    @IBAction func fontChange(_ sender: UIButton) {
        print("memo:Picker起動")
        let fontName = ["Zapfino","DBLCDTempBlack","MarkerFelt-Thin"]
        DPPickerManager.shared.showPicker(title: "Strings Picker", selected: "Value 1", strings: fontName) { (value, index, cancel) in
            if !cancel {
                // TODO: you code here
                self.fontStyle = value!
                self.fontLabel.text = self.fontStyle
                self.fontLabel.font = UIFont(name: value!, size: 13)
                print("memo:InspireListの数",self.inspireList.count)
                print("memo:tag",self.touchTag)
                if self.inspireList.count != 0 && self.touchTag != nil{
                    self.inspireList[self.touchTag].font = UIFont(name: value!, size:self.inspireList[self.touchTag].font.pointSize)
                    self.inspireList[self.touchTag].sizeToFit()
                }
            }
        }
        print("memo:Picker起動完了")
    }
    
    
    //文字のサイズ変更用のボタン
    @IBAction func upFontSize(_ sender: UIButton) {
        var nowFontSize = self.inspireList[self.touchTag].font.pointSize
        print(nowFontSize)
        self.inspireList[self.touchTag].font = self.inspireList[self.touchTag].font.withSize(nowFontSize + 1)
        self.inspireList[self.touchTag].sizeToFit()
    }
    @IBAction func downFontSize(_ sender: UIButton) {
        var nowFontSize = self.inspireList[self.touchTag].font.pointSize
        print(nowFontSize)
        self.inspireList[self.touchTag].font = self.inspireList[self.touchTag].font.withSize(nowFontSize - 1)
        self.inspireList[self.touchTag].sizeToFit()
    }
    
    
    @IBAction func changeColorSlider(_ sender: UISlider) {
        print("memo:",sender.value)
        switch sender.tag {
        case 0:
            r = CGFloat(sender.value)
        case 1:
            g = CGFloat(sender.value)
        case 2:
            b = CGFloat(sender.value)
        default:
            break
        }
        self.inspireList[self.touchTag].textColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
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



//ラベルをタッチした時の処理に関して
extension makePostViewController{
    @objc func labelTap(_ sender: UITapGestureRecognizer){
        let view = sender.view
        touchTag = view?.tag
        print("memo:touchTag",touchTag)
    }
    @objc func labelMove(_ sender: UIPanGestureRecognizer){
        var view = sender.view
        view?.center = sender.location(in: postImageView)
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
    
    //キーボードが表示された時に呼ばれる
    @objc func keyboardWillShow(notification: NSNotification) {
        if scrollView.isScrollEnabled{
            print("memo:keyBoardShow")
            scrollView.center.y -= 189
            scrollView.isScrollEnabled = false
        }
    }
    //キーボードが閉じる時に呼ばれる
    @objc func keyboardWillHide(notification: NSNotification) {
        print("memo:keyBoardHide")
        scrollView.center.y += 189
        scrollView.isScrollEnabled = true
    }
}

