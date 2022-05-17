//
//  Article.swift
//  NewsApp
//
//  Created by sudohostname on 04.09.2022.
//

import Foundation

struct Article: Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}
