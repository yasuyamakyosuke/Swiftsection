//
//  ChangeColor.swift
//  QuestionApp1
//
//  Created by 泰山恭輔 on 2020/12/05.
//

import Foundation
import UIKit

class ChangeColor{
    
    func changeColor(topR:CGFloat,topG:CGFloat,topB:CGFloat,topAlpha:CGFloat,bottomR:CGFloat,bottomG:CGFloat,bottomB:CGFloat,bottomAlpha:CGFloat)->CAGradientLayer{
        
        //グラデーションの開始色
        let topColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        
        let bottomColor = UIColor(red: bottomR, green: bottomG, blue: bottomB, alpha: bottomAlpha)
        
        //グラデーションの色を配列で管理
        
        let guradientColor = [topColor.cgColor,bottomColor.cgColor]
        
        let guradienLayer = CAGradientLayer()
        
        guradienLayer.colors = guradientColor
        
        return guradienLayer
        
    }

}
