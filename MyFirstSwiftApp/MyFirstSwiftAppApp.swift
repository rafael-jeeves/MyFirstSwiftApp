//
//  MyFirstSwiftAppApp.swift
//  MyFirstSwiftApp
//
//  Created by Rafael Guerra Evangelista on 07/08/25.
//

import SwiftUI

@main
struct MyFirstSwiftAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}
