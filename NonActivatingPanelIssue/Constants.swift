//
//  Constants.swift
//  RaycastWindowPlayground
//
//  Created by Petr Nikolaev on 11/02/2020.
//  Copyright © 2020 Raycast. All rights reserved.
//

import Cocoa

extension NSSize {
  static let screenSize = NSScreen.main?.frame.size ?? .zero
}

extension NSRect {
  static let mainPanelFrameMinified = NSRect(
    x: (NSSize.screenSize.width - AppLayoutConstants.mainPanelSize.width) / 2,
    y: 5 * (NSSize.screenSize.height - AppLayoutConstants.mainPanelSize.height) / 6,
    width: AppLayoutConstants.mainPanelSize.width,
    height: AppLayoutConstants.mainPanelSize.height
  )
}

public struct AppLayoutConstants {
  static public let windowCornerRadius: CGFloat = 12
  static public let mainPanelSize = NSSize(width: 940, height: 74)
}

extension NSColor {
  static let panelBackgroundColor = NSColor(hex: 0x1C1D1F)
}

extension NSColor {
  public convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")

    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }

  public convenience init(hex:Int) {
    self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
  }
}
