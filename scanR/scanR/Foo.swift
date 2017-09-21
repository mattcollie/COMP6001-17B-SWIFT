//
//  Foo.swift
//  scanR
//
//  Created by #MEMETEAM on 21/09/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import Foundation

class Foo {
    var code: String
    var room: String
    var time: String
    
    init?(code: String, room: String, time: String) {
    
    self.code = code
    self.room = room
    self.time = time
    }
}
