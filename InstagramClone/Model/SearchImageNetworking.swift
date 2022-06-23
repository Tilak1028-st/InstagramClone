//
//  SearchImageNetworking.swift
//  InstagramClone
//
//  Created by PCS213 on 22/06/22.
//

import Foundation
import UIKit
import Alamofire


class SearchImageNetworking {
    
    func getSearchImagesFromApi(page: Int, completion: @escaping  ([SearchImageModel]) -> Void) {
        
        let parameters : Parameters = [
            "page" : page,
            "limit": 100
        ] as [String : Any]
        
        Alamofire.request(Constant.imageUrl, method: .get, parameters: parameters).response {
            response in
            if let data = response.data {
                do {
                    let imageData = try JSONDecoder().decode([SearchImageModel].self, from: data)
                    completion(imageData)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

