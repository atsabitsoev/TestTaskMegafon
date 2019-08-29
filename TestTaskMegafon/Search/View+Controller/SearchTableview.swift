//
//  SearchTableview.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 29/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import UIKit


extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectCell(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height - scrollView.bounds.height <= scrollView.contentOffset.y {
            self.startSearch(searchServise.currentSearchString)
        }
    }
    
}
