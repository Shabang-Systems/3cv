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
    
    
    // Set string to clipboard
    let pasteboard = NSPasteboard.general
    
    func readBoard() {

    }
    
    
//#########################################################################################
//# FILE MANAGEMENT #
//#########################################################################################
    
    var prevItem = ""
    let dir = getDocumentsDirectory()
    let filename = getDocumentsDirectory().appendingPathComponent("historytest.txt")
    func saveToFile(value: String){
//        if value == prevItem { print("unchanged") } else {
//            prevItem = value
//            do {
//                filename.startAccessingSecurityScopedResource()
//                let strdir = try! String(contentsOf: dir).replacingOccurrences(of: "file://", with: "")
//                let items = try FileManager.default.contentsOfDirectory(atPath: strdir)
//                for item in items {
//                    if (item == "historytest.txt") {
//                        FileManager.default.createFile(atPath: try! String(contentsOf: dir), contents: nil)
//                    }
//                }
//                let fileHandle = try! FileHandle(forWritingTo: filename)
//                fileHandle.seekToEndOfFile()
//                fileHandle.write(value.data(using: .utf8)!)
//                fileHandle.closeFile()
//                readFile(value: value)
//                filename.stopAccessingSecurityScopedResource()
//            } catch {
////                print(error)
//            }
//        }
    }
    
    func readFile(value: String){
        do {
            let history = try String(contentsOf: filename, encoding: .utf8)
            print(history)
        } catch { print("ohnoes, dos") }
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

//#########################################################################################
