//
//  AppearanceModeAppApp.swift
//  AppearanceModeApp
//
//  Created by Madoka Suzuki on 2024/10/25.
//

import SwiftUI

@main
struct AppearanceModeAppApp: App {
    @StateObject private var userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSettings)
                .onAppear {
                    // 起動時に設定
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        if let window = windowScene.windows.first {
                            window.overrideUserInterfaceStyle = userSettings.appearanceMode.uIUserInterface
                        }
                    }
                }
                .onChange(of: userSettings.appearanceMode) { newValue in
                    // 変更時に設定
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        if let window = windowScene.windows.first {
                            // アニメーション
                            UIView.transition(with: window, duration: 0.5,
                                              // アニメーション中も操作を受け付けるように.allowUserInteractionを追加
                                              options: [.transitionCrossDissolve, .allowUserInteraction],
                                              animations: {
                                    window.overrideUserInterfaceStyle = newValue.uIUserInterface
                                }, completion: nil)
                        }
                    }
                }
        }
    }
}
