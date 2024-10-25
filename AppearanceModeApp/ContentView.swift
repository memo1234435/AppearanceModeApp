//
//  ContentView.swift
//  AppearanceModeApp
//
//  Created by Madoka Suzuki on 2024/10/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        VStack {
            List(UserSettings.appearanceModeType.allCases, id: \.self) { mode in
                Button {
                    userSettings.appearanceMode = mode
                } label: {
                    HStack {
                        Text("\(mode)")
                        Spacer()
                        if userSettings.appearanceMode == mode {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserSettings())
}
