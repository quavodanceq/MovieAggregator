//  
//  MainScreenInteractor.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 11.07.2024.
//

import Foundation

protocol MainScreenInteractorInput {
    
    var output: MainScreenInteractorOutput? { get set }
    
    func fetchMovies(for sections: ClosedRange<Int>, page: Int)
    
    func fetchMoviesForSection(section: Int, page: Int)
}

protocol MainScreenInteractorOutput: AnyObject {
    
    func moviesWasFetched(movies: [MovieSection])
    
    func moviesForSectionWasFetched(moviesSection: MovieSection)
    
}

extension MainScreenInteractorInput {
    func fetchMovies(for sections: ClosedRange<Int>) {
        fetchMovies(for: sections, page: 1)
    }
}

class MainScreenInteractor: MainScreenInteractorInput {
    
    
    func fetchMoviesForSection(section: Int, page: Int) {
        
        Task {
            guard let moviesSection = await Network.shared.fetchByGenre(genreID: section, page: page) else { return }
            DispatchQueue.main.async {
                self.output?.moviesForSectionWasFetched(moviesSection: moviesSection)
            }
            
        }
        
        
        
    }
    
    
    func fetchMovies(for sections: ClosedRange<Int>, page: Int = 1) {
        
        Task {
            let movies = await withTaskGroup(of: MovieSection?.self, body: { taskGroup -> [MovieSection] in
                
                var movies : [MovieSection] = []
                
                for section in sections {
                    taskGroup.addTask {
                        await Network.shared.fetchByGenre(genreID: section, page: page)
                    }
                    
                }
                
                for await movie in taskGroup {
                    if let movieToAppend = movie {
                        movies.append(movieToAppend)
                        
                    }
                    
                }
                
                return movies.sorted {
                    $0.section < $1.section
                }
                
            })
            
            DispatchQueue.main.async {
                self.output?.moviesWasFetched(movies: movies)
            }
        }
    }
    
    
    
    weak var output: MainScreenInteractorOutput?
    
}
