//
//  SongDTO.swift
//  YT-Vapor-API
//
//  Created by Pratama One on 06/01/25.
//

import Fluent
import Vapor

struct SongDTO: Content {
    var id: UUID?
    var title: String?
    
    func toSongModel() -> Song {
        let model: Song = Song()
        
        model.id = self.id
        if let title: String = self.title {
            model.title = title
        }
        return model
    }
}
