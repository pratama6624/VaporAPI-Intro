//
//  CreateSongs.swift
//  YT-Vapor-API
//
//  Created by Pratama One on 05/01/25.
//

import Fluent

struct CreateSongs: Migration {
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs").delete()
    }
    
    
}
