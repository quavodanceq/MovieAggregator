//
//  Genre.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 16.07.2024.
//

import Foundation

func transformToGenreID(section: Int) -> Int {
    switch section {
    case 0:
        return 33
    case 1:
        return 28
    case 3:
        return 53
    case 4:
        return 99
    case 5:
        return 36
    case 6:
        return 35
    case 7:
        return 10752
    
    default:
        return 0
    }
}

enum Genre: String {
    
    case action = "Action"
    case adventure = "Adventure"
    case animation = "Animation"
    case comedy = "Comedy"
    case crime = "Crime"
    case documentary = "Documentary"
    case drama = "Drama"
    case family = "Family"
    case fantasy = "Fantasy"
    case history = "History"
    case horror = "Horror"
    case music = "Music"
    case mystery = "Mystery"
    case romance = "Romance"
    case scienceFiction = "Science Fiction"
    case tvMovie = "TV Movie"
    case thriller = "Thriller"
    case war = "War"
    case western = "Western"
    case popular = "Popular movies"
    case actionAdventure = "Action & Adventure"
    case kids = "Kids"
    case news = "News"
    case reality = "Reality"
    case sciFiFantasy = "Sci-Fi & Fantasy"
    case soap = "Soap"
    case talk = "Talk"
    case warPolitics = "War & Politics"
            
    static func getGenres(by ids: [Int]) -> [Genre]{
        
        var genres: [Genre] = []
        
        for id in ids {
            switch id {
            case 28:
                genres.append(.action)
            case 35:
                genres.append(.comedy)
            case 80:
                genres.append(.crime)
            case 36:
                genres.append(.history)
            case 10752:
                genres.append(.war)
            case 878:
                genres.append(.scienceFiction)
            default:
                break
            }
        }
        return genres
    }
    
    static func getGenre(by section: Int) -> Genre {
            switch section {
            case 0:
                return .popular
            case 1:
               return .action
            case 2:
                return .comedy
            case 3:
                return .crime
            case 4:
                return .history
            case 5:
                return .war
            case 6:
                return .scienceFiction
            default:
                return .action
            }
    }
    
    static func getId(by section: Int) -> Int {
        switch section {
        case 1:
            return 28
        case 2:
            return 35
        case 3:
            return 80
        case 4:
            return 36
        case 5:
            return 10752
        case 6:
            return 878
        case 7:
            return 10751
        case 8:
            return 878
        case 9:
            return 878
        case 10:
            return 878
        case 11:
            return 878
        case 12:
            return 878
        case 13:
            return 878
        case 14:
            return 878
        case 15:
            return 878
        default:
            return 0
        }
    }
}

extension [Genre] {
    
    func stringRep() -> String {
        var str = String()
        for i in self {
            str.append("\(i.rawValue) ")
        }
        var replaced = str.replacingOccurrences(of: " ", with: ",")
        if replaced.hasSuffix(",") {
            replaced.removeLast()
        }
        return replaced
    }
}


