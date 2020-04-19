//
//  LocationData.swift
//  Clight
//
//  Created by Mukesh Kumar on 2020-04-18.
//  Copyright © 2020 Mukesh. All rights reserved.
//

import Foundation

struct LocationData:Codable{
    
    let data:[DataObject]
}

struct DataObject:Codable {
    let type:String
    let id:String
    let attributes:Attributes
}

struct Attributes:Codable {
    let name:String
}
