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
    var documents: [Any]?
    var clipboardHistory = [String]()
    
//
//    // Made constructor since this allows setup to be run when it should
//    init() {
//        clipboardHistory = [String]() // TODO remove (not required)
//        documents = getContentOfDir(path: fileDir)
//         // loop through file paths, and append toy fileCache array
//        for file in documents! {
//            let fileContents = readFile(path: file as! URL)
//            if (fileContents != "error") {
//                clipboardHistory.append(readFile(path: file as! URL))
//            }
//        }
//        print(clipboardHistory)
//    }
//
    // Made constructor since this allows setup to be run when it should
    init() {
//        clipboardHistory = [String]() // TODO remove (not required)
        documents = getContentOfDir(path: fileDir)
//         // loop through file paths, and append toy fileCache array
//        for file in documents! {
//            let extenstion = (file as AnyObject).absoluteURL?.pathExtension
//            if extenstion == "eer" {
//    //                print(file)
//    //                let fileContents = readFile(path: file as! URL)
//                clipboardHistory.append(readFile(path: file as! URL))
//            }
//        }
//    //        print(clipboardHistory)
    }
    

//#########################################################################################
//# FILE MANAGEMENT #
//#########################################################################################

    // SAVE to a file
    func saveToFile(value: String) {
        // update list of current documents
        documents = getContentOfDir(path: fileDir) // TODO delete
        if value != prevItem {
            var latestFilePath = (documents as! [String]).sorted(by: >)[0]
            print(latestFilePath)
//            print(documents! as Int.sorted(by: >))
//            print(latestFilePath)
            do {
                let strdir = dir.absoluteString
                
                let latestFile = (latestFilePath.replacingOccurrences(of: strdir, with: "") as AnyObject).replacingOccurrences(of: ".eer", with: "")
//                print(latestFile)
                let newFilePath = URL(string: strdir+(String(Int(latestFile)!+1)+".eer"))!
                print(newFilePath)
                try value.write(to: newFilePath, atomically: true, encoding: String.Encoding.utf8)
            } catch {
                // bruh bruh bruh bruh
            }
            prevItem = value
        } else {
            print("unchanged")
        }
//        // only save if item differs previous item
//        if (value == prevItem) { // TODO delete and change to if value != prevItem for efficiency
//            print("unchanged")
//        } else { prevItem = value; do {
//                // write value to file
//                try value.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
//                // this is just here for tests right now
//            } catch { print("error") }
//        }
    }

    // READ from a file
    func readFile(path: URL) -> String {
        
        do {
            // get contents of file
            let history = try String(contentsOf: path, encoding: .utf8)
            return history
        } catch {
            print("broke at \(path)")
            return "error"
        }
    }
    
    // gives array of filenames in specified directory
    func getContentOfDir(path: URL) -> Array<Any> {
        var filteredDirContents = [String]()
        
        // get array of file paths in directory
        let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: [])
        
        for file in directoryContents {
            if file.absoluteString.contains("eer") {
                filteredDirContents.append(file.absoluteString)
            }
            
//            let ext = (file as AnyObject).absoluteURL?.pathExtension
//            if ext == "eer" {
            
//            if file.absoluteString.contains("eer") {
                
//            }
//            }
        
        }
        return filteredDirContents
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

