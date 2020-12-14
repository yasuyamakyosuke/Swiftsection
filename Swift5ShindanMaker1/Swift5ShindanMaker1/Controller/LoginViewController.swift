//
//  LoginViewController.swift
//  Swift5ShindanMaker1
//
//  Created by 泰山恭輔 on 2020/12/11.
//

import UIKit
import FirebaseAuth
import NVActivityIndicatorView

class LoginViewController: UIViewController {
    
    var provider:OAuthProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.provider = OAuthProvider(providerID: TwitterAuthProviderID)
        provider?.customParameters = ["lang":"ja"]
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func twitterLogin(_ sender: Any) {
        self.provider = OAuthProvider(providerID: TwitterAuthProviderID)
        provider?.customParameters = ["force_login":"true"]
        provider?.getCredentialWith(nil, completion: { (credential, error) in
            //ActivityIndicatorView
            let activityView = NVActivityIndicatorView(frame: self.view.bounds, type: .ballBeat, color: .blue, padding: .none)
            self.view.addSubview(activityView)
            activityView.startAnimating()
            
            //ログインの処理が始まる
            
            Auth.auth().signIn(with: credential!) { (result, error) in
                if error != nil{
                    return
                }
                activityView.stopAnimating()
                
                //画面遷移
                let viewVC = self.storyboard?.instantiateViewController(identifier: "viewVC") as! ViewController
                viewVC.userName = (result?.user.displayName)!
                self.navigationController?.pushViewController(viewVC, animated: true)
            }
        })
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
