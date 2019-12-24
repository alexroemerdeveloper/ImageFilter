//
//  ImageSaver.swift
//  ImageFilter
//
//  Created by Alexander Römer on 20.12.19.
//  Copyright © 2019 Alexander Römer. All rights reserved.
//

import UIKit

class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Saved finished")
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
    
}
