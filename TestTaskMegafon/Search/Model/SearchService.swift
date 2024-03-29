//
//  SearchService.swift
//  TestTaskMegafon
//
//  Created by Ацамаз Бицоев on 29/08/2019.
//  Copyright © 2019 Ацамаз Бицоев. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class SearchService {
    
    
    static let standard = SearchService()
    private init() {}
    
    
    private var currentResults: [Character]?
    private var currentPage: Int = 1
    private var nextPageExists = true
    var currentSearchString: String = "nil"
    
    
    func searchPeople(by searchString: String,
                      handler: @escaping (_ characters: [Character]?) -> ()) {
        guard searchString != currentSearchString || nextPageExists else { return }
        
        if searchString == currentSearchString {
            print(searchString)
            currentPage += 1
        } else {
            currentPage = 1
        }
        
        let url = "\(ApiInfo.baseUrl)/?page=\(currentPage)&search=\(searchString)"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil,
                   interceptor: nil)
            .responseJSON { (response) in
                
                do {
                    
                    let responseValue = try response.result.get()
                    let json = JSON(responseValue)
                    print(json)
                    
                    switch response.response?.statusCode {
                        
                    case 200:
                        
                        self.nextPageExists = json["next"].string != nil
                        let results = json["results"].arrayValue
                        let characters = self.parseCharactersFromJSONArray(results: results)
                        
                        
                        self.currentResults = searchString == self.currentSearchString ? (self.currentResults ?? []) + characters : characters
                        
                        self.currentSearchString = searchString
                        handler(self.currentResults)
                        
                    default:
                        handler(nil)
                    }
                    
                } catch {
                    handler(nil)
                }
        }
    }
    
    
    func sendEmptySearchRequest(handler: @escaping (_ characters: [Character]?) -> ()) {
        searchPeople(by: "",
                     handler: handler)
    }
    
    
    private func parseCharactersFromJSONArray(results: [JSON]) -> [Character] {
        let newResults = results.map({ (json) -> Character in
            let character = Character(name: json["name"].stringValue,
                                      birthYear: json["birth_year"].stringValue,
                                      eyeColor: json["eye_color"].stringValue,
                                      gender: json["gender"].stringValue,
                                      hairColor: json["hair_color"].stringValue,
                                      height: json["height"].stringValue,
                                      mass: json["mass"].stringValue,
                                      skinColor: json["skin_color"].stringValue,
                                      homeWorld: json["homeworld"].stringValue,
                                      films: json["films"].arrayValue.map({ (json) -> String in
                                        json.stringValue
                                      }),
                                      species: json["species"].arrayValue.map({ (json) -> String in
                                        json.stringValue
                                      }),
                                      starships: json["starships"].arrayValue.map({ (json) -> String in
                                        json.stringValue
                                      }),
                                      vehicles: json["vehicles"].arrayValue.map({ (json) -> String in
                                        json.stringValue
                                      }),
                                      url: json["url"].stringValue,
                                      created: json["created"].stringValue,
                                      edited: json["edited"].stringValue)
            return character
        })
        
        return newResults
    }
    
    
}
