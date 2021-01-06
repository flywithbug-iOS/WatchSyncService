//
//  ViewController.swift
//  Example
//
//  Created by Anton Belousov on 15/01/2019.
//  Copyright © 2019 kp. All rights reserved.
//

import UIKit
import WatchSyncService

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var count:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GenericSyncService.default.onReceived(type: Message.self) { (message) in
            DispatchQueue.main.async {
                print("message: ", message)
                self.label.text = message.text
            }
        }
    }

    @IBAction
    func buttonPingPressed() {
        count += 1
        GenericSyncService.default.send(Message(text: "ping\(count)")) { (value) in
            
        }
    }

    @IBAction
    func buttonPongPressed() {
        count += 1
        GenericSyncService.default.send(Message(text: "pong\(count)")) { (value) in
            
        }
    }
}

struct Message {
    let text: String
}

extension Message: ISyncItem {
    static var syncTypeId: ISyncItemType {
        return "message"
    }
    
    var syncValue: Any {
        return text
    }
    
    static func instatiate(with syncValue: Any) -> ISyncItem? {
        if let syncValue = syncValue as? String {
            return Message(text: syncValue)
        }
        return nil
    }
}
