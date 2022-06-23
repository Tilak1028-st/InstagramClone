//
//  ImageSearchViewModel.swift
//  InstagramClone
//
//  Created by PCS213 on 22/06/22.
//

import Foundation
import UIKit

class ImageSearchViewModel
{
    var imageSearch = [SearchImageModel]()
    var imageNetwork = SearchImageNetworking()
    var hasMoreData: Bool = false
    static var page: Int = 0
    
    init() {
        self.imageSearch = [SearchImageModel]()
    }
    
    func getSearchImageData(page:Int,isPagination: Bool, completion: @escaping (Bool)-> Void) {
        imageNetwork.getSearchImagesFromApi(page: page) {[weak self] (serachImages) in
            if isPagination {
                self?.imageSearch.append(contentsOf: serachImages)
            }
            else {
                self?.imageSearch = serachImages
            }
            self?.hasMoreData = (serachImages.count < 100) ? false : true
            completion(true)
        }
    }
    
}
