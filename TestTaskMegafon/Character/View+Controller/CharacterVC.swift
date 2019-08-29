//
//  CharacterVC.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 29/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import UIKit

class CharacterVC: UIViewController {
    
    
    var character: Character!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = character.name
        CoreDataServise.standard.saveCharacter(character)
    }

}
