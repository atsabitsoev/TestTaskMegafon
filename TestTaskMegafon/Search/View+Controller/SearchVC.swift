//
//  SearchVC.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 29/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    
    let searchServise = SearchService.standard
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var timer: Timer?
    
    var characters: [Character] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchServise.sendEmptySearchRequest(handler: showNewSearchData(_:))
    }
    
    
    func showNewSearchData(_ characters: [Character]?) {
        
        guard let characters = characters else {
            showErrorAlert()
            return
        }
        
        self.characters = characters
        tableView.reloadData()
    }
    
    
    private func showErrorAlert() {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Не удалось совершить поиск",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    
    func startSearch(_ str: String) {
        searchServise.searchPeople(by: str, handler: showNewSearchData(_ :))
    }
    
    
    func didSelectCell(_ row: Int) {
        
        let storyboard = UIStoryboard(name: "Character", bundle: nil)
        let characterVC = storyboard.instantiateViewController(withIdentifier: "CharacterVC") as! CharacterVC
        characterVC.character = characters[row]
        self.navigationController?.show(characterVC, sender: nil)
    }

}
