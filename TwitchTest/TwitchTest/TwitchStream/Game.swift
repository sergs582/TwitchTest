//
//  Game.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import Foundation

struct Game: Codable {
    var _id: Int
    var box: Box
    var name: String
}

struct Box: Codable {
    var medium: String
}
