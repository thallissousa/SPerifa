//
//  UserDefaults+Extension.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 15/01/22.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case isOnboarding
    }
    //MARK: Extensão com Get e Set que irá verificar se o usuário já fez entrou no aplicativo ou não
   
    var isOnboarding: Bool {
        get {
            bool(forKey: UserDefaultsKeys.isOnboarding.rawValue)
        } set {
            setValue(newValue, forKey: UserDefaultsKeys.isOnboarding.rawValue)
        }
    }
}
