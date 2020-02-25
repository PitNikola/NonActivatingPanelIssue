//
//  ViewController.swift
//  RaycastWindowPlayground
//
//  Created by Petr Nikolaev on 11/02/2020.
//  Copyright © 2020 Raycast. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let searchBar = SearchBarView(frame: view.bounds)
    searchBar.autoresizingMask = [.width, .height]
    view.addSubview(searchBar)
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
}

