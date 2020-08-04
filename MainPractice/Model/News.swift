//
//  News.swift
//  MainPractice
//
//  Created by Apple on 8/3/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import Foundation

struct News: Codable {
    var id: String?
    var title: String?
    var content: String?
    var image: String?
//    var v: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case content
        case image
//        case v = "__v"
    }
}

struct DataNews: Codable {
    var data: [News]?
}
