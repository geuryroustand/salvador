//
//  saveImageToGallery.swift
//  salvador
//
//  Created by Geury Roustand on 28.02.23.
//

import Foundation
import SwiftUI



class saveImage {
    static let share = saveImage()
    
    
    var imageURL: URL?
    
    func saveImageToGallery() {
    
        guard let url = imageURL else {    return   }

        DispatchQueue.global(qos: .background).async {
            let data = try! Data(contentsOf: url)

            let image = UIImage(data: data)!

            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)

        }

    }
    
}
