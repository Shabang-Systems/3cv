//
//  PasteboardManager.swift
//  3cv
//
//  Created by 3cv on 7/4/20.
//  Copyright © 2020 Shabang Systems, LLC. All rights reserved.
//

import Foundation
import Cocoa



class Clipboard {
    
    let pasteboard = NSPasteboard.general
    var prevItem = ""
    let dir = getDocumentsDirectory()
    let filename = getDocumentsDirectory().appendingPathComponent("testWrite2.txt")
    let fileDir = getDocumentsDirectory()

//#########################################################################################
//# FILE MANAGEMENT #
//#########################################################################################

    // SAVE to a file
    func saveToFile(value: String) {
        // only save if item differs previous item
        if (value == prevItem) { print("unchanged") } else { prevItem = value; do {
            
                // write value to file
                try value.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
//                readFile(value: value)
                // this is just here for tests right now
                getContentOfDir(path: fileDir)
                
            } catch { print("error") }
        }
    }

    // READ from a file
    func readFile(value: String) {
        
        do {
            
            // get contents of file
            let history = try String(contentsOf: filename, encoding: .utf8)
            print(history)
            
        } catch { print("ohnoes, dos") }
    }
    
    // gives array of filenames in specified directory
    func getContentOfDir(path: URL) {
        
        let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: [])
        
        for file in directoryContents {
             //TBI: read each file, push to array
            print("Found \(file)")
        }
        
    }
    
    
    
    
    
    
}


//##########################################################################################
//# HELPERS #
//#########################################################################################

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

//#########################################################################################
