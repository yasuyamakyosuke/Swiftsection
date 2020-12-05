//
//  imagesList.swift
//  QuestionApp1
//
//  Created by 泰山恭輔 on 2020/12/05.
//

import Foundation

class ImagesList{
    
    var list = [ImagesModel]()
    init(){
        
        list.append(ImagesModel(imageName: "0", CorrectOrNot: true))
        list.append(ImagesModel(imageName: "1", CorrectOrNot: false))
        list.append(ImagesModel(imageName: "2", CorrectOrNot: false))
        list.append(ImagesModel(imageName: "3", CorrectOrNot: false))
        list.append(ImagesModel(imageName: "4", CorrectOrNot: true))
        list.append(ImagesModel(imageName: "5", CorrectOrNot: false))
        list.append(ImagesModel(imageName: "6", CorrectOrNot: true))
        list.append(ImagesModel(imageName: "7", CorrectOrNot: true))
        list.append(ImagesModel(imageName: "8", CorrectOrNot: false))
        list.append(ImagesModel(imageName: "9", CorrectOrNot: true))
        list.append(ImagesModel(imageName: "10", CorrectOrNot: true))
    }
}
