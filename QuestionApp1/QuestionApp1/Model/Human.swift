//
//  Human.swift
//  QuestionApp1
//
//  Created by 泰山恭輔 on 2020/12/05.
//

import Foundation

class Human:Animal{
    
    override func breath() {
        super.breath()
        profile()
    }
    
    func profile(){
        
        print("私は人間です")
    }
    
}
