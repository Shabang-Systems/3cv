//
//  FileExperiments.swift
//  3cv
//
//  Created by Shmenius on 7/11/20.
//  Copyright © 2020 Shabang Systems, LLC. All rights reserved.
//

import Foundation
import Cocoa

class Filetest {
    let filename = getDocumentsDirectory().appendingPathComponent("history.txt")
    let str = "Super long string here"
    static func testWrite() {
        let filename = getDocumentsDirectory().appendingPathComponent("history.txt")
        let str = "Super long string here"

        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            print("written")
        } catch {
            print("bad")
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
        testRead()
    }
    
    static func printer(){
        print("yay")
    }
    
    
    static func testRead() {
        let filename = getDocumentsDirectory().appendingPathComponent("testWrite1.txt")
        do {
            let text2 = try String(contentsOf: filename, encoding: .utf8)
            print(text2)

        } catch {
            print("bad 2, electrig boogalo")
        }
        print("read")
        
    }
    
    
    
}
    

//func getDocumentsDirectory() -> URL {
//    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//    return paths[0]
//}
