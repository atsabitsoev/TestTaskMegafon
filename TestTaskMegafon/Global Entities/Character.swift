//
//  Character.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 29/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation


class Character {
    
    
    init(name: String,
         birthYear: String,
         eyeColor: String,
         gender: String,
         hairColor: String,
         height: String,
         mass: String,
         skinColor: String,
         homeWorld: String,
         films: [String],
         species: [String],
         starships: [String],
         vehicles: [String],
         url: String,
         created: String,
         edited: String) {
        
        self.name = name
        self.birthYear = birthYear
        self.eyeColor = eyeColor
        self.gender = gender
        self.hairColor = hairColor
        self.height = height
        self.mass = mass
        self.skinColor = skinColor
        self.homeWorld = homeWorld
        self.films = films
        self.species = species
        self.starships = starships
        self.vehicles = vehicles
        self.url = url
        self.created = created
        self.edited = edited
        
    }
    
    
  var name: String
  var birthYear: String
  var eyeColor: String
  var gender: String
  var hairColor: String
  var height: String
  var mass: String
  var skinColor: String
  var homeWorld: String
  var films: [String]
  var species: [String]
  var starships: [String]
  var vehicles: [String]
  var url: String
  var created: String
  var edited: String
    
}
