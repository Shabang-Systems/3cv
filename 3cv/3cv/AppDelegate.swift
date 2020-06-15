//
//  AppDelegate.swift
//  3cv
//
//  Created by Zachary on 6/14/20.
//  Copyright © 2020 Shabang Systems, LLC. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    enum operatingSystemErrors: Error{
        case InvalidVersion(version: String)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        try! validateOperatingSystem() // Checks current MacOS version and throws an error if it isn't good enough
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func validateOperatingSystem() throws {
        if #available(OSX 10.15, *) {
            print("MacOS catalalina detected, proceed")
        } else {
            let warning = NSLocalizedString("Invalid Version of MacOS", comment: "Quit without saves error question message")
            let info = NSLocalizedString("3cv is not currently compatible with version 10.\(String(ProcessInfo.processInfo.operatingSystemVersion.minorVersion)) of MacOS. Please consider upgrading to version 10.15 (Catalina), or later", comment: "Quit without saves error question info");
            
            let quitButton = NSLocalizedString("Quit application", comment: "Quit anyway button title")
            let alert = NSAlert()
            alert.messageText = warning
            alert.informativeText = info
            alert.addButton(withTitle: quitButton)
            
            let answer = alert.runModal()
            if answer == .alertFirstButtonReturn {
                NSApplication.shared.terminate(self)
            } else {
                NSApplication.shared.terminate(self)
            }
        }
    }

    // MARK: - Core Data stack
    
    @available(OSX 10.15, *)
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "_cv")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                  
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving and Undo support
    @available(OSX 10.15, *)
    @IBAction func saveAction(_ sender: AnyObject?) {
        // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
        let context = persistentContainer.viewContext

        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Customize this code block to include application-specific recovery steps.
                let nserror = error as NSError
                NSApplication.shared.presentError(nserror)
            }
        }
    }
    @available(OSX 10.15, *)
    func windowWillReturnUndoManager(window: NSWindow) -> UndoManager? {
        // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
        return persistentContainer.viewContext.undoManager
    }
    
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply{
        // Save changes in the application's managed object context before the application terminates.
        if #available(OSX 10.15, *) {
            let context = persistentContainer.viewContext


        
        if !context.commitEditing() {
            NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing to terminate")
            return .terminateCancel
        }
        
        if !context.hasChanges {
            return .terminateNow
        }
        
        do {
            try context.save()
        } catch {
            let nserror = error as NSError

            // Customize this code block to include application-specific recovery steps.
            let result = sender.presentError(nserror)
            if (result) {
                return .terminateCancel
            }
            
            let question = NSLocalizedString("Could not save changes while quitting. Quit anyway?", comment: "Quit without saves error question message")
            let info = NSLocalizedString("Quitting now will lose any changes you have made since the last successful save", comment: "Quit without saves error question info");
            let quitButton = NSLocalizedString("Quit anyway", comment: "Quit anyway button title")
            let cancelButton = NSLocalizedString("Cancel", comment: "Cancel button title")
            let alert = NSAlert()
            alert.messageText = question
            alert.informativeText = info
            alert.addButton(withTitle: quitButton)
            alert.addButton(withTitle: cancelButton)
            
            let answer = alert.runModal()
            if answer == .alertSecondButtonReturn {
                return .terminateCancel
            }
        }
        // If we got here, it is time to quit.
            return .terminateNow
        } else {
            return .terminateNow
        }
    }
}

