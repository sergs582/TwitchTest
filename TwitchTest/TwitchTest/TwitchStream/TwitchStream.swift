//
//  TwitchStream.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import Foundation

struct TwitchStream: Codable {
    var channels: Int
    var viewers: Int
    var game: Game
    
}
