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
        
        
        // add listener
        NotificationCenter.default.addObserver(self, selector: #selector(onPasteboardChanged),  name: .NSPasteboardDidChange, object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    var clipboard = Clipboard()
    @objc
    func onPasteboardChanged(_ notification: Notification) {
        guard let pb = notification.object as? NSPasteboard else { return }
        guard let items = pb.pasteboardItems else { return }
        guard let item = items.first?.string(forType: .string) else { return }
        clipboard.saveToFile(value: item)
    }

    
    
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
    }
}

