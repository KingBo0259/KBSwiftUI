//
//  KBImageLoader.swift
//  KBSwiftUIV1
//
//  Created by 金灵波 on 2019/7/17.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

final class KBImageLoader : BindableObject {
    let didChange = PassthroughSubject<UIImage? ,Never>()
    let path:String?
    let size : ImageService.Size
    var image :UIImage? = nil {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self.image)
            }
        }
    }
    
    var missing:Bool = false {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(nil)
            }
        }
    }
    
    init(path:String?,size:ImageService.Size) {
        self.path = path
        self.size = size
    }
    
    func loadImage()  {
        guard let poster = path else {
            missing = true
            return
        }
        
        ImageService.shared.image(poster: poster, size: size) { [weak self] result in
                switch result {
                case .success(let image ):
                        self?.image = image
                    break
                case .failure:
                    self?.image = nil
                }
        }
    }
}


