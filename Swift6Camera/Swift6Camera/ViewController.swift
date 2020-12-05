//
//  ViewController.swift
//  Swift6Camera
//
//  Created by 泰山恭輔 on 2020/12/06.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var checkPermission = CheckPermission()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPermission.checkCamera()
    }

    @IBOutlet weak var backimageView: UIImageView!
    
    @IBAction func camera(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .camera
        createImagePicker(sourceType: sourceType)
    }
    
    @IBAction func album(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
        
        
    }
    
    @IBAction func share(_ sender: Any) {
        
        let text = ""
        let image = backimageView.image?.jpegData(compressionQuality: 0.5)
        let item = [text,image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
        
        //インスタンスを作成
        
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    //撮影、アルバムのキャンセルボタンが押された時
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.editedImage] as? UIImage{
            backimageView.image = pickerImage
            //閉じる処理
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
}

