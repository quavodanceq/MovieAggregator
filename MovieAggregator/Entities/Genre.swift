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
    
    
    case comedy = "Comedy"
    case action = "Action"
    case crime = "Crime"
    case history = "History"
    case war = "War"
    case thriller = "Thriller"
    case scienceFiction = "Science Fiction"
    case popular = "Popular movies"
    
    static func getGenres(by ids: [Int]) -> [Genre]{
        
        var genres: [Genre] = []
        
//        Action          28
//        Adventure       12
//        Animation       16
//        Comedy          35
//        Crime           80
//        Documentary     99
//        Drama           18
//        Family          10751
//        Fantasy         14
//        History         36
//        Horror          27
//        Music           10402
//        Mystery         9648
//        Romance         10749
//        Science Fiction 878
//        TV Movie        10770
//        Thriller        53
//        War             10752
//        Western         37
        
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
    
    static func getGenre(by section: Int) -> Genre{
        
//        Action          28
//        Adventure       12
//        Animation       16
//        Comedy          35
//        Crime           80
//        Documentary     99
//        Drama           18
//        Family          10751
//        Fantasy         14
//        History         36
//        Horror          27
//        Music           10402
//        Mystery         9648
//        Romance         10749
//        Science Fiction 878
//        TV Movie        10770
//        Thriller        53
//        War             10752
//        Western         37
        
        
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


