//
//  LoginViewController.swift
//  
//
//  Created by Togami Yuki on 2018/10/19.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        //グーグルのボタンを追加
        let googleBtn = GIDSignInButton()
        var screenWidth = self.view.frame.size.width
        var screenHeight = self.view.frame.size.height
        googleBtn.frame = CGRect(x:screenWidth*0.1,y:screenHeight*2/3,width:screenWidth - screenWidth*0.2,height:60)
        view.addSubview(googleBtn)
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



//Googleログインに関する処理
extension LoginViewController:GIDSignInUIDelegate,GIDSignInDelegate{
    //Googleログイン時の処理
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        //Googleログイン時エラーが発生したら、エラーを返し、この関数から抜ける
        if let error = error {
            print("memo:Googleログイン後エラー",error)
            return
        }
        //authenticationに情報が入っていなかったら、この関数から抜ける
        guard let authentication = user.authentication else { return }
        
        //ログインに成功したら、各種トークンを受け取る
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        
        //トークンを受け取った後の処理を記述.Googleから得たトークンをFirebaseへ保存
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print("memo:FirebaseへGoogleから得たトークン保存時にエラー",error)
                return
            }
            print("memo:Googleログイン成功",authResult?.additionalUserInfo)
        }
    }
    //ログイン失敗時の処理
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        //Googleログイン時エラーが発生したら、エラーを返し、この関数から抜ける
        if let error = error {
            print("memo:Googleログイン失敗エラー",error)
            return
        }
    }
}
