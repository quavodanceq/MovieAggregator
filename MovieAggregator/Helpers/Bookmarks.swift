//
//  Bookmarks.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 14.09.2024.
//

import Foundation

extension UserDefaults {
    
    @objc dynamic private(set) var observableProductsData: Data? {
                get {
                    UserDefaults.standard.data(forKey: "bookmarks")
                }
                set { UserDefaults.standard.set(newValue, forKey: "bookmarks") }
            }
    
    var movies: [Movie]{
       get{
           guard let data = UserDefaults.standard.data(forKey: "bookmarks") else { return [] }
           return (try? JSONDecoder().decode([Movie].self, from: data)) ?? []
       } set{
           observableProductsData = try? JSONEncoder().encode(newValue)
       }
    }
}
