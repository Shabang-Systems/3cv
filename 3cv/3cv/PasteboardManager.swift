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
    var prevItem = ""
    let filename = getDocumentsDirectory().appendingPathComponent("history.txt")
    
    // Set string to clipboard
    let pasteboard = NSPasteboard.general
    
    func readBoard() {

    }
//    var clear = ""
    func saveToFile(value: String){
        if value == prevItem {
            print("unchanged")
        } else {
            prevItem = value
            do {
//              try clear.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
                let fileHandle = try FileHandle(forWritingTo: filename)
                fileHandle.seekToEndOfFile()
                fileHandle.write(value.data(using: .utf8)!)
                fileHandle.closeFile()
                readFile(value: value)
            } catch {
               print("ohnoes")
            }
            
        }
        
    }
    
    func readFile(value: String){
        //reading
        do {
            let history = try String(contentsOf: filename, encoding: .utf8)
            print(history)
        } catch {/* error handling here */}
    }
}


// file stuff
func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    // just send back the first one, which ought to be the only one
    return paths[0]
}




