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
    let filename = getDocumentsDirectory().appendingPathComponent(manageFileNaming(value: "fileNameTest1"))
    let fileDir = getDocumentsDirectory()
    var fileCache = [String]()
    
    
    // Made constructor since this allows setup to be run when it should
    init() {
        // just for ssafety (and testing), clear the array
        fileCache = [String]() // TODO remove (not required)
        
         // loop through file paths, and append to fileCache array
        for file in getContentOfDir(path: fileDir) {
//            if !(file as AnyObject).contains("iChats") {
//            print((file as AnyObject).contains("/"))
//            }
            fileCache.append(readFile(path: file as! URL))
        }
        print(fileCache)

    }
    

//#########################################################################################
//# FILE MANAGEMENT #
//#########################################################################################

    // SAVE to a file
    func saveToFile(value: String) {
        // only save if item differs previous item
        if (value == prevItem) { print("unchanged") } else { prevItem = value; do {
            
                // write value to file
                try value.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            
                // this is just here for tests right now
            } catch { print("error") }
        }
    }

    // READ from a file
    func readFile(path: URL) -> String {
        
        do {
            
            // get contents of file
            let history = try String(contentsOf: path, encoding: .utf8)
            return history

        } catch { print("broke at \(path)") }
        
        // swift bad
        return ""
    }
    
    // gives array of filenames in specified directory
    func getContentOfDir(path: URL) -> Array<Any> {
        
        // get array of file paths in directory
        let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: [])
        return directoryContents
        
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

//idk how to swift man

func manageFileNaming(value: String) -> String {
    
    // idk man.
    return value
}

