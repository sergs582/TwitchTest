//
//  TwitchStreamDataManager.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import Foundation
import CoreData

class TwitchStreamDataManager {
    private var context : NSManagedObjectContext!
    private var streamEntities = [TwitchStreamEntity]()
    
    private func fetchStreams(predicate: NSPredicate?) {
        context = CoreDataStack().persistentContainer.viewContext
        let request : NSFetchRequest<TwitchStreamEntity> = TwitchStreamEntity.fetchRequest()
        if predicate != nil {
            request.predicate = predicate
        }
        do{
            let results = try context.fetch(request)
            streamEntities = results
        }catch{
            print(error)
        }
    }
    
    func toTwitchStream() -> [TwitchStream] {
        var streams = [TwitchStream]()
        fetchStreams(predicate: nil)
        guard streamEntities.count != 0 else { return streams}
        for streamEntity in streamEntities {
            streams.append(toTwitchStream(streamEntity))
        }
        return streams
    }
    
    func toTwitchStream(_ streamEntity: TwitchStreamEntity) -> TwitchStream {
        let stream = TwitchStream(channels: Int(streamEntity.channels), viewers: Int(streamEntity.viewers), game: Game(_id: Int(streamEntity.id), box: Box(medium: streamEntity.cover!), name: streamEntity.title!))
        return stream
    }
    
    
    func saveStream(stream: TwitchStream) -> Bool {
        context = CoreDataStack().persistentContainer.viewContext
        let savingStream = TwitchStreamEntity(context: context)
        var success = false
        savingStream.id = Int32(stream.game._id)
        savingStream.title = stream.game.name
        savingStream.channels = Int32(stream.channels)
        savingStream.viewers = Int32(stream.viewers)
        savingStream.cover = stream.game.box.medium
        
            do{
                try self.context.save()
                success = true
            }catch{
                print(error)
                success = false
            }
        return success
    }
}
