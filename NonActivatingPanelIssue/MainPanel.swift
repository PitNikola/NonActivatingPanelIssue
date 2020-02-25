//
//  MainPanel.swift
//  RaycastWindowPlayground
//
//  Created by Petr Nikolaev on 11/02/2020.
//  Copyright © 2020 Raycast. All rights reserved.
//

import Cocoa

final class MainPanel: NSPanel, NSWindowDelegate {
  override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
    super.init(contentRect: contentRect, styleMask: [.nonactivatingPanel, .titled, .fullSizeContentView], backing: backingStoreType, defer: flag)

    isFloatingPanel = true
    titleVisibility = .hidden
    hidesOnDeactivate = true
    level = NSWindow.Level(rawValue: NSWindow.Level.mainMenu.rawValue - 1)
    isOpaque = true
    titlebarAppearsTransparent = true
    isMovableByWindowBackground = true
    tabbingMode = .disallowed
    minSize = AppLayoutConstants.mainPanelSize
    animationBehavior = .none
    backgroundColor = .panelBackgroundColor
    isExcludedFromWindowsMenu = true
    collectionBehavior = [.moveToActiveSpace, .ignoresCycle, .transient, .fullScreenAuxiliary]
    setFrameAutosaveName("Main Panel")
  }
}
