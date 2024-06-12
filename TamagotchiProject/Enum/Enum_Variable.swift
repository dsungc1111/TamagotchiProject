//
//  Enum_Variable.swift
//  TamagotchiProject
//
//  Created by 최대성 on 6/12/24.
//

import Foundation

struct Variable {
    
    static var changeTamaCount = 0
    
    
    static let userdefaults = UserDefaults.standard
    
    static var tamagotchi = "pickedtamagotchi"
    
    static var pickedTama: Int {
        get {
            return userdefaults.integer(forKey: tamagotchi)
        }
        set {
            userdefaults.setValue(newValue, forKey: tamagotchi)
        }
    }
    
    
    static var user: String {
        get {
            return UserDefaults.standard.string(forKey: "user") ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKeyPath: "user")
            
        }
    }
    
    
//    static let userdefaults = UserDefaults.standard
    static var level: Int {
        get {
            return userdefaults.integer(forKey: Constant.variablesName.lvCac.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.lvCac.rawValue)
        }
    }
    static var lvCac: Int {
        get {
            return userdefaults.integer(forKey: Constant.variablesName.lvCac.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.lvCac.rawValue)
        }
    }
    static var lvSun: Int {
        get {
            return userdefaults.integer(forKey: Constant.variablesName.lvSun.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.lvSun.rawValue)
        }
    }
    static var lvStar: Int {
        get {
            return userdefaults.integer(forKey: Constant.variablesName.lvStar.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.lvStar.rawValue)
        }
    }
    static var riceTotalOfCactus: Double {
        get {
            return userdefaults.double(forKey: Constant.variablesName.riceTotalOfCactus.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.riceTotalOfCactus.rawValue)
        }
    }
    
    static var riceTotalOfSun: Double {
        get {
            return userdefaults.double(forKey: Constant.variablesName.riceTotalOfSun.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.riceTotalOfSun.rawValue)
        }
    }
    static var riceTotalOfStar: Double {
        get {
            return userdefaults.double(forKey: Constant.variablesName.riceTotalOfStar.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.riceTotalOfStar.rawValue)
        }
    }
    static var waterTotalOfCactus: Double {
        get {
            return userdefaults.double(forKey: Constant.variablesName.waterTotalOfCactus.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.waterTotalOfCactus.rawValue)
        }
    }
    static var waterTotalOfStar: Double {
        get {
            return userdefaults.double(forKey: Constant.variablesName.waterTotalOfStar.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.waterTotalOfStar.rawValue)
        }
    }
    static var waterTotalOfSun: Double {
        get {
            return userdefaults.double(forKey: Constant.variablesName.waterTotalOfSun.rawValue)
        }
        set {
            userdefaults.setValue(newValue, forKey: Constant.variablesName.waterTotalOfSun.rawValue)
        }
    }
  
    
}
