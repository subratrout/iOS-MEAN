//
//  ViewController.swift
//  meanPrac
//
//  Created by SubratRout on 5/7/15.
//  Copyright (c) 2015 Subrat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var javascriptButtonPressed: UIButton!
    
    var javascript_counter = 0
    var swift_counter = 0
    @IBAction func yellowButtonPressed(sender: UIButton) {
        javascript_counter++
        socket.emit("javascript", javascript_counter)
    }
    
    @IBAction func orangeButtonPressed(sender: UIButton) {
        swift_counter++
        socket.emit("swift", swift_counter)
    }
    
    let socket = SocketIOClient(socketURL: "192.168.15.112:6789")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socket.connect()
        
        socket.on("connect"){ data, ack in
            println("iOS:: WE ARE USEING SOCKETS!")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

