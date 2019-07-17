//
//  KBDiscoverConverImage.swift
//  KBSwiftUIV1
//
//  Created by 金灵波 on 2019/7/17.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI


struct KBDiscoverPosterStyle :ViewModifier {
    func body(content: Content) -> some View {
      return content
        .aspectRatio(0.66, contentMode: .fit)
        .frame(maxWidth: UIApplication.shared.windows.first!.bounds.width * 0.65,
               maxHeight: UIApplication.shared.windows.first!.bounds.height * 0.65)
        .cornerRadius(5)
    }
}

extension View {
    func discoverPosterStyle() -> some View {
        Modified(content: self, modifier: KBDiscoverPosterStyle())
    }
}

struct KBDiscoverConverImage : View {
    @State var imageLoader: KBImageLoader
    
    var cachedImage: UIImage? {
        if let poster = imageLoader.path {
            return ImageService.shared.syncImageFromCache(poster: poster, size: imageLoader.size)
        }
        return nil
    }
    
    var body: some View {
        ZStack {
            if cachedImage != nil || imageLoader.image != nil {
                Image(uiImage: cachedImage ?? self.imageLoader.image!)
                    .resizable()
                    .renderingMode(.original)
                    .discoverPosterStyle()
            } else if imageLoader.missing == true {
                Rectangle()
                    .foregroundColor(.gray)
                    .discoverPosterStyle()
            } else {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 50, height: 50)
            }
        }.onAppear {
            self.imageLoader.loadImage()
        }
    }
}

#if DEBUG
struct KBDiscoverConverImage_Preview :  PreviewProvider{
      static var previews: some View {
        KBDiscoverConverImage(imageLoader: KBImageLoader(path: "/mKxpYRIrCZLxZjNqpocJ2RdQW8v.jpg", size: .small))
    }
}
#endif


