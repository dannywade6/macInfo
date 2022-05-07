//
//  macInfoApp.swift
//  macInfo
//
//  Created by Danny Wade on 07/05/2022.
//

import SwiftUI

@main
struct macInfoApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
