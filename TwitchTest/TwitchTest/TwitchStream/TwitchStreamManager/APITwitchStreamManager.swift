//
//  APITwitchStreamManager.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import Foundation

final class APITwitchStreamManager: APIManager {
    let sessionConfiguration: URLSessionConfiguration
    lazy var session: URLSession = {
        return URLSession(configuration: sessionConfiguration)
    }()
    
    init(sessionConfiguration: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    convenience init() {
        self.init(sessionConfiguration: URLSessionConfiguration.default)
    }
    
    func fetchTwitchStreams(page: Int = 0, completion: @escaping (APIResult<TwitchStreamAPIResponse>) -> Void) {
        let baseURL = "https://api.twitch.tv/kraken/games/top?offset=\(page)"
        var request = URLRequest(url: URL(string: baseURL)!)
        
        request.addValue("application/vnd.twitchtv.v5+json", forHTTPHeaderField: "Accept" )
        request.addValue("sd4grh0omdj9a31exnpikhrmsu3v46", forHTTPHeaderField: "Client-ID")
        fetch(request: request, decode: { (data) -> TwitchStreamAPIResponse? in
            do{
                let recipes = try JSONDecoder().decode(TwitchStreamAPIResponse.self, from: data)
                return recipes
            }catch let error {
                print(error)
                return nil
            }
        }, completion: completion)
    }
}
