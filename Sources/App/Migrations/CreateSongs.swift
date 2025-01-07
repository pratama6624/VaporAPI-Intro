//
//  CreateSongs.swift
//  YT-Vapor-API
//
//  Created by Pratama One on 05/01/25.
//

import Fluent

struct CreateSongs: AsyncMigration {
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.schema("songs")
            .id()
            .field("title", .string, .required)
            .field("artist", .string, .required)
            .field("album", .string, .required)
            .field("genre", .string, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("songs").delete()
    }
}
