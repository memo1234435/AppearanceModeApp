//
//  UserSettings.swift
//  AppearanceModeApp
//
//  Created by Madoka Suzuki on 2024/10/25.
//

import SwiftUI

class UserSettings: ObservableObject {
    
    enum appearanceModeType: String, CaseIterable {
        case followSystem
        case lightMode
        case darkMode
        
        var uIUserInterface: UIUserInterfaceStyle {
            switch self {
            case .followSystem:
                return .unspecified
            case .lightMode:
                return .light
            case .darkMode:
                return .dark
            }
        }
    }
    
    let userDefaults: UserDefaults = UserDefaults.standard
    
    @Published var appearanceMode: appearanceModeType {
        didSet {
            userDefaults.set(appearanceMode.rawValue, forKey: "appearanceMode")
        }
    }
    
    init() {
        if let appearanceModeSetting = userDefaults.string(forKey: "appearanceMode"),
           let appearanceMode = appearanceModeType(rawValue: appearanceModeSetting) {
            self.appearanceMode = appearanceMode
        } else {
            self.appearanceMode = .followSystem
        }
    }
}
