//
//  ViewController.swift
//  3cv
//
//  Created by Zachary on 6/14/20.
//  Copyright © 2020 Shabang Systems, LLC. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {


    @IBOutlet var urbadButton: NSButton!
    var alternateImageThing: NSImage = NSImage(byReferencingFile: "buttonImage.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urbadButton.insertText("test")
        urbadButton.alternateImage = alternateImageThing


        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
    }
}

