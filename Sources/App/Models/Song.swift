//
//  Song.swift
//  YT-Vapor-API
//
//  Created by Pratama One on 05/01/25.
//

import Fluent
import Vapor

final class Song: Model, Content, @unchecked Sendable {
    static let schema: String = "songs"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "artist")
    var artist: String
    
    @Field(key: "album")
    var album: String
    
    @Field(key: "genre")
    var genre: String
    
    init() { }
    
    init(id: UUID? = nil, title: String, artist: String, album: String, genre: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.album = album
        self.genre = genre
    }
    
    func toSongDTO() -> SongDTO {
        .init(
            id: self.id,
            title: self.$title.value,
            artist: self.$album.value,
            album: self.$album.value,
            genre: self.$genre.value
        )
        
    }
}
