//
//  SavedViewViewModel.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import Foundation

class SavedViewViewModel {
    
    var twitchStreamsArray: Boxing<[TwitchStream]?> = Boxing(nil)
    
    var twitchStreamDataManager = TwitchStreamDataManager()
    
    init() {
        twitchStreamsArray.value = twitchStreamDataManager.toTwitchStream()
    }
}
