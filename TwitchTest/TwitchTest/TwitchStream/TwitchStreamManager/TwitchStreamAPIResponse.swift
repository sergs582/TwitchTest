//
//  APIResponse.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import Foundation

struct TwitchStreamAPIResponse: Codable {
    var top: [TwitchStream]
}
