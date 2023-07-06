//
//  PhotosModel.swift
//  Navigation
//
//  Created by Валерий Климченко on 19.06.2023.
//

import UIKit

struct PhotosModel {
    
    let photo: String
    
    static func makePhotosModel() -> [PhotosModel] {
        var count = 1
        var arrayPhoto = [PhotosModel]()
        for _ in 1...20 {
            arrayPhoto.append(PhotosModel(photo: String(count)))
            count += 1
        }
        return arrayPhoto
    }
    
}
