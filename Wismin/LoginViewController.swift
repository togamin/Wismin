//
//  LoginViewController.swift
//  
//
//  Created by Togami Yuki on 2018/10/19.
//

import UIKit
import Firebase
import GoogleSignIn
import TwitterKit

class LoginViewController: UIViewController {

    var screenWidth = UIScreen.main.bounds.size.width
    var screenHeight = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        //グーグルのボタンを追加
        GoogleLoginBtn()
        //Twitterログインボタンを追加
        TwitterLoginBtn()
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



//Googleログインに関する処理
extension LoginViewController:GIDSignInUIDelegate,GIDSignInDelegate{
    //Googleログインのボタン
    func GoogleLoginBtn(){
        let googleBtn = GIDSignInButton()
        googleBtn.frame = CGRect(x:screenWidth*0.1,y:screenHeight*2/3,width:screenWidth - screenWidth*0.2,height:48)
        view.addSubview(googleBtn)
    }
    
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

//Twitterログインに関する関数
extension LoginViewController{
    func TwitterLoginBtn(){
        
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                let authToken = session?.authToken
                let authTokenSecret = session?.authTokenSecret
                print("memo:",authToken)
                let credential = TwitterAuthProvider.credential(withToken: authToken!, secret: authTokenSecret!)
                Auth.auth().signIn(with: credential) { (user, error) in
                    if let error = error {
                        print("memo:FirebaseへTwitterから得たトークン保存時にエラー",error)
                        return
                    }
                    print("memo:Twitterログイン成功")
                }
            } else {
                print("memo:Twitterログインエラー")
            }
        })
        logInButton.frame = CGRect(x:screenWidth*0.11,y:screenHeight*2/3 + 60,width:screenWidth - screenWidth*0.22,height:45)
        view.addSubview(logInButton)
    }
}




