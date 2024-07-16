//
//  Network.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 13.07.2024.
//

import Foundation

class Network {
    
    private init() {}
    
    static let shared = Network()
    
    func fetch(section: Int, page: Int) async {

        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "\(page)"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NmExNjE5NGY3YzBiM2QzZDE0ZmIwOTMwYmU1MGQ5ZCIsIm5iZiI6MTcyMDYwOTA5Ny44MjY4OTMsInN1YiI6IjY0OTAxNDU5MjYzNDYyMDEyZDRiMmNlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sTH7deiXa2hcLh49zCxu-cfJFOegLpIZvacZVK87V6c"
        ]

        do {
            
            let (data, _) = try await URLSession.shared.data(for: request)
            print(String(decoding: data, as: UTF8.self))
        } catch {
            
        }
        
    }
    
    func fetchByGenre(genreID: Int, page: Int) async {
        
        
//        URLQueryItem(name: "language", value: "en-US"),
//          URLQueryItem(name: "page", value: "1"),
//          URLQueryItem(name: "sort_by", value: "vote_average.desc"),
//          URLQueryItem(name: "vote_count.gte", value: "3000")

        let url = URL(string: "https://api.themoviedb.org/3/discover/movie")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        var queryItems: [URLQueryItem] = [
          URLQueryItem(name: "include_adult", value: "false"),
          URLQueryItem(name: "include_video", value: "false"),
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "\(page)"),
          URLQueryItem(name: "vote_count.gte", value: "3000"),
          URLQueryItem(name: "sort_by", value: "vote_average.desc"),
        ]
        if genreID != 0 {
            queryItems.append(URLQueryItem(name: "with_genres", value: "\(genreID)"))
        }
        
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
            
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NmExNjE5NGY3YzBiM2QzZDE0ZmIwOTMwYmU1MGQ5ZCIsIm5iZiI6MTcyMDYwOTA5Ny44MjY4OTMsInN1YiI6IjY0OTAxNDU5MjYzNDYyMDEyZDRiMmNlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sTH7deiXa2hcLh49zCxu-cfJFOegLpIZvacZVK87V6c"
        ]

        do {
            
            let (data, _) = try await URLSession.shared.data(for: request)
            print(String(decoding: data, as: UTF8.self))
        } catch {
            
        }
    }
    
}
