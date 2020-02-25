//
//  MainSearchFieldView.swift
//  Raycast
//
//  Created by Petr Nikolaev on 05/12/2019.
//  Copyright © 2019 Raycast. All rights reserved.
//

import Cocoa

class SearchBarView: NSView {
  lazy var textField: NSTextField = {
    let textField = NSTextField()
    textField.font = NSFont.systemFont(ofSize: 16)
    textField.maximumNumberOfLines = 1
    textField.textColor = .white
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = .clear
    textField.isBezeled = false
    textField.drawsBackground = false
    textField.cell?.focusRingType = .none
    textField.cell?.wraps = false
    textField.cell?.isScrollable = true
    textField.maximumNumberOfLines = 1
    textField.cell?.truncatesLastVisibleLine = true
    return textField
  }()

  lazy var hintLabel: NSTextField = {
    let textField = NSTextField()
    textField.isSelectable = false
    textField.isEditable = false
    textField.isBordered = false
    textField.maximumNumberOfLines = 1
    textField.backgroundColor = nil
    textField.drawsBackground = false
    textField.font = .systemFont(ofSize: 14)
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.alignment = .left
    textField.cell?.truncatesLastVisibleLine = true
    return textField
  }()

  private var hoverTrackingArea: NSTrackingArea?

  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)

    addSubview(textField)
    addSubview(hintLabel)

    hintLabel.stringValue = "Press 'Option + Space' to toggle the panel"

    setupConstraints()

    hoverTrackingArea = makeHoverTrackingArea()
    addTrackingArea(hoverTrackingArea!)

    textField.placeholderString = "Mouse cursor should change to I-beam when over this text field"
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      hintLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      hintLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
      textField.centerYAnchor.constraint(equalTo: centerYAnchor),
      textField.heightAnchor.constraint(equalToConstant: 20),
      textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
      textField.rightAnchor.constraint(equalTo: hintLabel.leftAnchor, constant: -25)
    ])
  }

  override open func updateTrackingAreas() {
    if let trackingArea = hoverTrackingArea {
      removeTrackingArea(trackingArea)
    }

    hoverTrackingArea = makeHoverTrackingArea()
    addTrackingArea(hoverTrackingArea!)

    super.updateTrackingAreas()
  }

  private func makeHoverTrackingArea() -> NSTrackingArea {
    return NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited, .activeAlways], owner: self, userInfo: nil)
  }

  // MARK: Mouse events
  override open func mouseEntered(with event: NSEvent) {
    print("Mouse Entered: Trying to make cursor I-Beam")
    NSCursor.iBeam.push()
  }

  override open func mouseExited(with event: NSEvent) {
    print("Mouse Exited: Popping cursor")
    NSCursor.pop()
  }
}
