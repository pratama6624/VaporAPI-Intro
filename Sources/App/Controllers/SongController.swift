//
//  SongController.swift
//  YT-Vapor-API
//
//  Created by Pratama One on 05/01/25.
//

import Fluent
import Vapor

struct SongController: RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let songs = routes.grouped("songs")
        
        songs.get(use: self.index)
        songs.post(use: self.create)
        songs.group(":songID") { song in
            song.put(use: self.update)
        }
        songs.group(":songID") { song in
            song.delete(use: self.delete)
        }
    }
    
    // GET Request /songs
    @Sendable
    func index(req: Request) async throws -> [SongDTO] {
        try await Song.query(on: req.db).all().map { $0.toSongDTO()}
    }
    
    // POST Request /songs
    @Sendable
    func create(req: Request) async throws -> SongDTO {
        let song = try req.content.decode(SongDTO.self).toSongModel()
        
        try await song.save(on: req.db)
        return song.toSongDTO()
    }
    
    // PUT Request /songs/id
    @Sendable
    func update(req: Request) async throws -> HTTPStatus {
        guard let songID = req.parameters.get("songID", as: UUID.self) else {
            throw Abort(.badRequest, reason: "Invalid or missing songID")
        }
        
        let updatedSong = try req.content.decode(SongDTO.self)
        
        guard let existingSong = try await Song.find(songID, on: req.db) else {
            throw Abort(.notFound, reason: "Song with ID \(songID) not found.")
        }
            
        // Update field dengan data baru
        existingSong.title = updatedSong.title ?? existingSong.title
        existingSong.artist = updatedSong.artist ?? existingSong.artist
        existingSong.album = updatedSong.album ?? existingSong.album
        existingSong.genre = updatedSong.genre ?? existingSong.genre

        // Simpan perubahan ke database
        try await existingSong.update(on: req.db)
        return .ok
    }
    
    // DELETE Request /songs/id
    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let song = try await Song.find(req.parameters.get("songID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        try await song.delete(on: req.db)
        return .noContent
    }
}
