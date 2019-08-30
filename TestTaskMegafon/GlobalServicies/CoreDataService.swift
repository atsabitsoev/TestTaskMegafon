//
//  CoreDataService.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 29/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class CoreDataServise {
    
    
    private init() {}
    static let standard = CoreDataServise()
    
    
    func saveCharacter(_ character: Character) {
        
        guard !isEntityInDB(character.name) else { return }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
       createEntity(character, context: context)
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func getSavedCharacters() -> [Character] {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            
            let savedCharacters = try context.fetch(CharacterEntity.fetchRequest()) as! [CharacterEntity]
            let newSavedCharacters = savedCharacters.map { (characterEntity) -> Character in
                return Character(name: characterEntity.name!,
                                 birthYear: characterEntity.birthYear!,
                                 eyeColor: characterEntity.eyeColor!,
                                 gender: characterEntity.gender!,
                                 hairColor: characterEntity.hairColor!,
                                 height: characterEntity.height!,
                                 mass: characterEntity.mass!,
                                 skinColor: characterEntity.skinColor!,
                                 homeWorld: characterEntity.homeWorld!,
                                 films: characterEntity.films as? [String] ?? [],
                                 species: characterEntity.species as? [String] ?? [],
                                 starships: characterEntity.starships as? [String] ?? [],
                                 vehicles: characterEntity.vehicles as? [String] ?? [],
                                 url: characterEntity.url!,
                                 created: characterEntity.created!,
                                 edited: characterEntity.edited!)
            }
            
            return newSavedCharacters
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    
    func deleteAllCharacters() -> Bool {
        
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CharacterEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
            return true
        }
        catch
        {
            print ("There was an error")
            return false
        }
        
    }
    
    
    private func isEntityInDB(_ characterName: String) -> Bool {
        return getSavedCharacters().contains(where: { (character) -> Bool in
            return character.name == characterName
        })
    }
    
    
    private func createEntity(_ character: Character, context: NSManagedObjectContext) {
        
        let characterEntity = CharacterEntity(entity: CharacterEntity.entity(),
                        insertInto: context)
        characterEntity.birthYear = character.birthYear
        characterEntity.created = character.created
        characterEntity.edited = character.edited
        characterEntity.eyeColor = character.eyeColor
        characterEntity.setValue(character.films, forKey: "films")
        characterEntity.gender = character.gender
        characterEntity.hairColor = character.hairColor
        characterEntity.height = character.height
        characterEntity.homeWorld = character.homeWorld
        characterEntity.mass = character.mass
        characterEntity.name = character.name
        characterEntity.skinColor = character.skinColor
        characterEntity.setValue(character.species, forKey: "species")
        characterEntity.setValue(character.starships, forKey: "starships")
        characterEntity.url = character.url
        characterEntity.setValue(character.vehicles, forKey: "vehicles")
    }
 
}
