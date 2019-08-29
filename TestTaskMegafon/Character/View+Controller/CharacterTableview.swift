//
//  CharacterTableview.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 29/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import UIKit


extension CharacterVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.textColor = .darkGray
        cell.detailTextLabel?.textColor = .black
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Birth year"
            cell.detailTextLabel?.text = character.birthYear
        case 1:
            cell.textLabel?.text = "Eye color"
            cell.detailTextLabel?.text = character.eyeColor
        case 2:
            cell.textLabel?.text = "Gender"
            cell.detailTextLabel?.text = character.gender
        case 3:
            cell.textLabel?.text = "Hair color"
            cell.detailTextLabel?.text = character.hairColor
        case 4:
            cell.textLabel?.text = "Height"
            cell.detailTextLabel?.text = character.height
        case 5:
            cell.textLabel?.text = "Mass"
            cell.detailTextLabel?.text = character.mass
        case 6:
            cell.textLabel?.text = "Skin color"
            cell.detailTextLabel?.text = character.skinColor
        case 7:
            cell.textLabel?.text = "Films"
            cell.detailTextLabel?.text = "\(character.films.count)"
        case 8:
            cell.textLabel?.text = "Species"
            cell.detailTextLabel?.text = "\(character.species.count)"
        case 9:
            cell.textLabel?.text = "Starships"
            cell.detailTextLabel?.text = "\(character.starships.count)"
        case 10:
            cell.textLabel?.text = "Vehicles"
            cell.detailTextLabel?.text = "\(character.vehicles.count)"
        default:
            cell.textLabel?.text = "Vehicles"
            cell.detailTextLabel?.text = "\(character.vehicles.count)"
        }
        
        return cell
    }
    
    
}
