//
//  InterfaceController.swift
//  watch Extension
//
//  Created by Anton Belousov on 15/01/2019.
//  Copyright © 2019 kp. All rights reserved.
//

import WatchKit
import Foundation
import WatchSyncService

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        GenericSyncService.default.onReceived(type: Message.self) { (message) in
            DispatchQueue.main.async {
                self.label.setText(message.text)
            }
        }
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    var count:Int = 0
    @IBAction func pingButtonPressed() {
        count += 1
        GenericSyncService.default.send(Message(text: "ping\(count)")) { (value) in
            
        }
    }
    
    @IBAction func pongButtonPressed() {
        count += 1
        GenericSyncService.default.send(Message(text: "pong\(count)")) { (value) in
            
        }
    }
}
