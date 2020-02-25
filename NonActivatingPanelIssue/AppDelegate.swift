//
//  AppDelegate.swift
//  RaycastWindowPlayground
//
//  Created by Petr Nikolaev on 11/02/2020.
//  Copyright © 2020 Raycast. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  var hotKey: HotKey!

  var window: NSPanel!

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    self.window = NSApp.keyWindow as? NSPanel

    self.window.makeKeyAndOrderFront(nil)
    self.window.becomesKeyOnlyIfNeeded = true

    hotKey = HotKey(key: .space, modifiers: .option)
    hotKey.keyDownHandler = {
      if self.window.isKeyWindow {
        self.window.close()
        NSApp.hide(self)
      } else {
        self.window.makeKeyAndOrderFront(nil)
      }
    }
  }

  func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    window.makeKeyAndOrderFront(self)
    return false
  }

  func applicationWillBecomeActive(_ notification: Notification) {
    window?.makeKeyAndOrderFront(self)
  }
}

