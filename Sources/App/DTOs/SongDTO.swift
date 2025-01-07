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
    var artist: String?
    var album: String?
    var genre: String?
    
    func toSongModel() -> Song {
        let model: Song = Song()
        
        model.id = self.id
        if let title: String = self.title {
            model.title = title
        }
        if let artist: String = self.artist {
            model.artist = artist
        }
        if let album: String = self.album {
            model.album = album
        }
        if let genre: String = self.genre {
            model.genre = genre
        }
        return model
    }
}
