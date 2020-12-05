//
//  imagesModel.swift
//  QuestionApp1
//
//  Created by 泰山恭輔 on 2020/12/05.
//

import Foundation

class ImagesModel{
    
    
    //画像名を取得して、その画像名が人間かそうでないかをフラグによって判定するための機能
    
    let imageText:String
    let answer:Bool
    
    init(imageName:String,CorrectOrNot:Bool){
        
        imageText = imageName
        answer = CorrectOrNot
        
    }
    
}
