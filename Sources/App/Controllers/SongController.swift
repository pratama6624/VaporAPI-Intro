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
    }
    
//    @Sendable
//    func index(req: Request) async throws -> [SongDTO] {
//        try await Song.query(on: req.db).all().map { $0.toSongDTO()}
//    }
    
    @Sendable
    func index(req: Request) async throws -> String {
        return "Hello, this is getting songs"
    }
    
    @Sendable
    func create(req: Request) async throws -> SongDTO {
        let song = try req.content.decode(SongDTO.self).toSongModel()
        
        try await song.save(on: req.db)
        return song.toSongDTO()
    }
    
    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        guard let song = try await Song.find(req.parameters.get("songID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        try await song.delete(on: req.db)
        return .noContent
    }
}
