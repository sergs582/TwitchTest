//
//  TopStreamsViewModel.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import Foundation

class TopStreamsViewModel {
    
    var twitchStreamsArray: Boxing<[TwitchStream]?> = Boxing(nil)
    var twitchStreamManager: APITwitchStreamManager
    
    func fetchStreams(page: Int = 0) {
        twitchStreamManager.fetchTwitchStreams { [weak self] result in
            switch result {
            case .Success(let response):
                self?.twitchStreamsArray.value = response.top
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    init(apiManager: APITwitchStreamManager) {
        twitchStreamsArray.value = []
        twitchStreamManager = apiManager
        DispatchQueue.global().async {
            self.fetchStreams()
        }
    }
}
