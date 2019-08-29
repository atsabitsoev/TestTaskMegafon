//
//  SearchSearchBarDelegate.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 29/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import UIKit


extension SearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = nil
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.3,
                                     repeats: false,
                                     block: { (_ ) in
                                        self.startSearch(searchText)
        })
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
