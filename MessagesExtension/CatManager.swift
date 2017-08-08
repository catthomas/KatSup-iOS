//
//  CatManager.swift
//  cataas
//
//  Created by Thomas, Catherine on 12/18/16.
//  Copyright © 2016 catt. All rights reserved.
//

import Foundation
import UIKit

class CatManager: NSObject {
    static let sharedInstance = CatManager()
    
    func getCat(success: @escaping (_ catImage: UIImage?) -> Void) {
        var request = URLRequest(url: URL(string: "http://cataas.com/cat")!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            if let data = data, let catImage = UIImage(data: data) {
                success(catImage)
                return
            }
            success(nil)
            }.resume()
    }
    
    func getCat(text: String, success: @escaping (_ catImage: UIImage?) -> Void) {
        var url = "http://cataas.com/cat"
        if let formattedText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            url += "/says/\(formattedText)"
        }
 
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            if let data = data, let catImage = UIImage(data: data) {
                success(catImage)
                return
            }
            success(nil)
            }.resume()
    }
}
