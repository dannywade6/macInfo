//
//  AppDelegate.swift
//  macInfo
//
//  Created by Danny Wade on 07/05/2022.
//

import Foundation
import SwiftUI
import Cocoa
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBar: StatusBarController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the contents
        if let window = NSApplication.shared.windows.first {
            window.close()
        }
        let contentView = ContentView()
        NSApp.setActivationPolicy(.accessory)

        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.contentSize = NSSize(width: 360, height: 360)
        popover.contentViewController = NSHostingController(rootView: contentView)

        // Create the Status Bar Item with the above Popover
        statusBar = StatusBarController.init(popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
