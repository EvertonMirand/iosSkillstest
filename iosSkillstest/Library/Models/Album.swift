//
//  Album.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//

import Foundation

public class Album: Decodable {
    var albumId: Int!
    var id: Int!
    var title: String!
    var imageUrl: String!
    var thumbnailUrl: String!

    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case imageUrl = "url"
        case thumbnailUrl
    }

    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        albumId = try values.decode(Int.self, forKey: CodingKeys.albumId)
        id = try values.decode(Int.self, forKey: CodingKeys.id)
        title = try values.decode(String.self, forKey: CodingKeys.title)
        imageUrl = try values.decode(String.self, forKey: CodingKeys.imageUrl)
        thumbnailUrl = try values.decode(String.self, forKey: CodingKeys.thumbnailUrl)
    }
}
