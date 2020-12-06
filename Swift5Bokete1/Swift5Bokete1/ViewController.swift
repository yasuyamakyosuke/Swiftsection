//
//  ViewController.swift
//  Swift5Bokete1
//
//  Created by 泰山恭輔 on 2020/12/06.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import Photos

class ViewController: UIViewController {
    
    
    @IBOutlet weak var odaiimageView: UIImageView!
    
    
    @IBOutlet weak var commentTextView: UITextView!
    
    
    @IBOutlet weak var serachTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTextView.layer.cornerRadius = 20.0
        
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status){
            
            case .authorized:break
            case .denied:break
            case .notDetermined:break
            case .restricted :break
        
                
            }
        }
    }
    //検索ワードの値を元に画像を引っ張ってくる
    func getImages(keyword:String){
        
        //apiley 19412758-5d25b3762cff11c8393ade679
        let url = "https://pixabay.com/api/?key=19412758-5d25b3762cff11c8393ade679&q=\(keyword)"
        
        //Almofireを使いhttpリクエストを投げる
        //値が返ってきて、それをjson解析を行う
    }


}

