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
    
    @IBAction func yellowButtonPressed(sender: UIButton) {
        socket.emit("javascript")
    }
    
    @IBAction func orangeButtonPressed(sender: UIButton) {
        socket.emit("Swift")
    }
    
    let socket = SocketIOClient(socketURL: "192.168.15.112")
    
    
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

