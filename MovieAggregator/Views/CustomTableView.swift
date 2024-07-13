//
//  CustomTableView.swift
//  MovieAggregator
//
//  Created by Куат Оралбеков on 13.07.2024.
//

import Foundation
import UIKit

class MyCustomTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "MyCustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let items = ["1","2","3","4","5"]
        cell.configure(with: items)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomTableViewCell", for: indexPath) as! CustomTableViewCell
//        let items = ["1","1","1","1","1"]
//        cell.configure(with: items)
//        return cell
//    }
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        
        let cell = self.dequeueReusableCell(withIdentifier: "MyCustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let items = ["1","1","1","1","1"]
        cell.configure(with: items)
        return cell
    }
    
    // Implement pagination logic here if needed (e.g., loading more data for each section as the user scrolls)
}
