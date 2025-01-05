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
    
    init() { }
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
