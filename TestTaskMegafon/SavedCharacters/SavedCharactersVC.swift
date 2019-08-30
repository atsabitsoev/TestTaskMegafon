//
//  SavedCharactersVC.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 30/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class SavedCharactersVC: UIViewController, UITabBarControllerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var characters: [Character] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        characters = CoreDataServise.standard.getSavedCharacters()
        self.navigationController!.tabBarController!.delegate = self
    }
    
    
    func didSelectCell(_ row: Int) {
        
        let storyboard = UIStoryboard(name: "Character", bundle: nil)
        let characterVC = storyboard.instantiateViewController(withIdentifier: "CharacterVC") as! CharacterVC
        characterVC.character = characters[row]
        self.navigationController?.show(characterVC, sender: nil)
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController == self.navigationController {
            characters = CoreDataServise.standard.getSavedCharacters()
        }
    }
    
    
    @IBAction func trashButTapped(_ sender: UIBarButtonItem) {
        
        if CoreDataServise.standard.deleteAllCharacters() {
            characters = []
            tableView.reloadData()
        }
    }
    

}
