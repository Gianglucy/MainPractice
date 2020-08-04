//
//  Movie.swift
//  MainPractice
//
//  Created by Apple on 7/27/20.
//  Copyright © 2020 NguyenDucLuu. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var posterPath:String?
    var originalTitle:String?
    var overview:String?
    var popularity: Float?
    var voteCount: Int?
    var video: Bool?
    var id: Int?
    var adult: Bool?
    var backdropPath: String?
    var originalLanguage: String?
    var title: String?
    var voteAverage: Float?
    var releaseDate: String?
    var genreIds: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case overview
        case popularity
        case voteCount = "vote_count"
        case video
        case id
        case adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case title
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
    }
}

struct dates: Codable {
    var maximum: String?
    var minimum: String?
    enum CodingKeys: String, CodingKey {
        case maximum
        case minimum
    }
}

struct DataMovie: Codable {
    var results: [Movie]?
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var dates: dates?
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case dates
    }
}
