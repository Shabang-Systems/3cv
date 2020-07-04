//
//  WindowController.swift
//  3cv
//
//  Created by Shmenius on 7/4/20.
//  Copyright © 2020 Shabang Systems, LLC. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
        window?.invalidateShadow()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
