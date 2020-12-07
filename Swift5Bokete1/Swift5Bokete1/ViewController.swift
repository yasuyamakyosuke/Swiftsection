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
    
    var count = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTextView.layer.cornerRadius = 20.0
        
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status){
            case .authorized:break
            case .denied:break
            case .notDetermined:break
            case .restricted:break
                
            case .notDetermined:break
                <#code#>
            case .restricted:break
                <#code#>
            case .denied:break
                <#code#>
            case .authorized:break

            case .limited:
                <#code#>
            @unknown default:
                <#code#>
            }
        }
        
        getImages(keyword: "funny")
    }
    //検索ワードの値を元に画像を引っ張ってくる
    func getImages(keyword:String){
        
        //APIkey 19412758-5d25b3762cff11c8393ade679
        let url = "https://pixabay.com/api/?key=19412758-5d25b3762cff11c8393ade679&q=\(keyword)"
        
        //Almofireを使いhttpリクエストを投げる
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
            
            case .success:
                let json:JSON = JSON(response.data as Any)
                var imageString = json["hits"][self.count]["webformatURL"].string
                
                
                if  imageString == nil{
                    imageString =
                        json["hits"][0]
                        ["webformatURL"].string
                        self.odaiimageView.sd_setImage(with: URL(string:imageString! ), completed: nil)
                }else{
                    self.odaiimageView.sd_setImage(with: URL(string:imageString! ), completed: nil)
                }
                
                self.odaiimageView.sd_setImage(with: URL(string:imageString! ), completed: nil)
                
            case .failure(let error):
                print(error)
            
                
            }
        }
        //値が返ってきて、それをjson解析を行う
    }

    @IBAction func nextOdai(_ sender: Any) {
        
        count = count + 1
        if serachTextField.text == ""{
            getImages(keyword: "funny")
        }else{
            getImages(keyword: serachTextField.text!)
        }
        
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        self.count = 0
        if serachTextField.text == ""{
            getImages(keyword: "funny")
        }else{
            getImages(keyword: serachTextField.text!)
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let shareVC = segue.destination as?
        ShareViewController
        shareVC?.commentString = commentTextView.text
        shareVC?.resultImage = odaiimageView.image!
        
    }
    
}

