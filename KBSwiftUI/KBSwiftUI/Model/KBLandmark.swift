//
//  KBLandmark.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import CoreLocation

struct KBLandmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: KBCoordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    
    var featureImage: Image? {
        guard isFeatured else { return nil }
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(verbatim: name))
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}


struct KBCoordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
