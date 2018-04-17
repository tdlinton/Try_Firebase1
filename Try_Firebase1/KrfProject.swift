//
//  KrfProject.swift
//  Try_Firebase1
//
//  Created by Thomas Linton on 3/26/18.
//  Copyright © 2018 Thomas Linton. All rights reserved.
//

import Foundation

class KrfProject {
    var name: String
    var parts = [KrfPart]()
    
    init(name aName: String)
    {
        self.name = aName
    }
}


class KrfPart {
    var name: String
    var length: Int
    
    init(name aName: String, length aLength: Int)
    {
        self.name = aName
        self.length = aLength
    }
}
