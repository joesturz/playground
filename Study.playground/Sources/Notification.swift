import Foundation

/*
 A FunkyNotificationCenter object provides broadcasts events within a program.
 
 Code that wants to observe notification events registers a closure via the
 addObserver(:for:block:) method.
 
 Code that sends notifications uses the post(notificationName:) method.
 Each closure that was registered for that notification name should be called.
 */

import Foundation

public class FunkyNotificationCenter {
    var stringDict:[String:[(() -> Void)]] = [:]
    func post(notificationName: String) {
        if let fun = stringDict[notificationName] {
            for f in fun {
                f()
            }
        }
    }
    
    func addObserver(for notificationName: String, block: @escaping () -> Void) -> Void {
        // TODO
        if var fun = stringDict[notificationName] {
            fun.append(block)
        } else {
            stringDict[notificationName] = [block]
        }
    }
    
}


// Example Usage

//let notificationCenter = FunkyNotificationCenter()


//notificationCenter.addObserver(for: "MyNotification1") {
//    print("Received notification: MyNotification1")
//}
//notificationCenter.addObserver(for: "MyNotification1") {
//    print("Received notification again: MyNotification1")
//}
//
//notificationCenter.post(notificationName: "MyNotification1")

// Expected Output:
// Received notification: MyNotification1
// Received notification again: MyNotification1

//notificationCenter.post(notificationName: "MyNotification2")

// Expected Output: none
