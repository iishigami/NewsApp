//
//  CacheManager.swift
//  NewsApp
//
//  Created by sudohostname on 04.09.2022.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data) {
        imageDictionary[url] = imageData
    }
    
    static func retrieveData(_ url:String) -> Data? {
        return imageDictionary[url]
    }
    
}
