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
    
    
    private func showDeleteDBAlert() {
        
        let alert = UIAlertController(title: nil,
                                      message: "Вы уверены, что хотите очистить базу данных?",
                                      preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Очистить",
                                         style: .destructive) { (_ ) in
                                            self.performDeleteAction()
        }
        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    private func performDeleteAction() {
        
        if CoreDataServise.standard.deleteAllCharacters() {
            characters = []
            tableView.reloadData()
        }
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController == self.navigationController {
            characters = CoreDataServise.standard.getSavedCharacters()
        }
    }
    
    
    @IBAction func trashButTapped(_ sender: UIBarButtonItem) {
        showDeleteDBAlert()
    }
    

}
