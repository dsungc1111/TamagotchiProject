//
//  Enum.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/11/24.
//

import Foundation

struct Constant {
    
    enum Character: String {
        case cactus = "따끔따끔 다마고치"
        case sun = "방실방실 다마고치"
        case star = "반짝반짝 다마고치"
    }
    
    
    enum DescriptionTamagotchi: String {
        
        case cactus = "\n\n저는 선인장 다마고치입니다. 키는 2cm, 몸무게는 150g이에요.\n성격은 소심하지만 마음은 따뜻해요.\n열심히 잘 먹고 클 자신은 있답니다\n반가워요 주인님!!!"
        case sun = "\n\n저는 방실방실 다마고치입니다. 키는 100km, 몸주게는 150톤이에용\n성격은 화끈하고 날라다닙니당~! \n열심히 잘 먹고 클 자신은 있답니당 방실방실!"
        case star = "\n\n얘는 설명이 없네요??"
    }
    
    
    enum variablesName: String {
        case lvCac
        case lvSun
        case lvStar
        case riceTotalOfCactus
        case riceTotalOfSun
        case riceTotalOfStar
        case waterTotalOfCactus
        case waterTotalOfSun
        case waterTotalOfStar
        case level
        
    }
   
    
}

