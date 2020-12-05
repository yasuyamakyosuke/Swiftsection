//
//  WIthOutMP3.swift
//  QuestionApp1
//
//  Created by 泰山恭輔 on 2020/12/05.
//

import Foundation

class WithOutMP3: SoundFile {
    
    override func playSound(fileName: String, extensionName: String) {
        
        if extensionName == "map3"{
            print("このファイルは再生できません")
        }
        player?.stop()
    }
}
