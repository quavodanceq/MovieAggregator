//  
//  MainScreenInteractor.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation

protocol MainScreenInteractorInput {
    
    var output: MainScreenInteractorOutput? { get set }
    
    func fetchMovies(for sections: Int, page: Int)
    
    func fetchMoviesForSection(section: Int, page: Int)
}

protocol MainScreenInteractorOutput: AnyObject {
    
    func moviesWasFetched(movies: [MovieSection])
    
    func moviesForSectionWasFetched(moviesSection: MovieSection)
    
}

class MainScreenInteractor: MainScreenInteractorInput {
    
    func fetchMoviesForSection(section: Int, page: Int) {
        
        Task {
            guard let moviesSection = await Network.shared.fetchByGenre(genreID: Genre.getId(by: section), page: page) else { return }
            DispatchQueue.main.async {
                self.output?.moviesForSectionWasFetched(moviesSection: moviesSection)
            }
            
        }
        
        
    }
    
    func fetchMovies(for sections: Int, page: Int) {
        
        Task {
            let movies = await withTaskGroup(of: MovieSection?.self, body: { taskGroup -> [MovieSection] in
                
                var movies : [MovieSection] = []
                
                for section in 1...sections {
                    taskGroup.addTask {
                        await Network.shared.fetchByGenre(genreID: section, page: page)
                    }
                    
                }
                
                for await movie in taskGroup {
                    if let movieToAppend = movie {
                        movies.append(movieToAppend)
                        
                    }
                    
                }
                
                return movies
                
            })
            
            DispatchQueue.main.async {
                self.output?.moviesWasFetched(movies: movies)
            }
        }
    }
    
    
    
    weak var output: MainScreenInteractorOutput?
    
}
