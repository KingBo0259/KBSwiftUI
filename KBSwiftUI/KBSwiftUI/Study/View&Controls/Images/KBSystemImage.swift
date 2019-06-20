//
//  KBSystemImage.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/20.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBSystemImage : View {
    var note = """

 * 下载 [SF Symbols](https://developer.apple.com/design/downloads/SF-Symbols.dmg)
 * 安装 SF Symbols
 * 运行 SF Symbols 就可以查看所有具体的图片

 """
    var body: some View {
        VStack {
            Text(note).lineLimit(nil)
            Image(systemName: "star.slash")
            Image(systemName: "star.slash.fill")
            Image(systemName: "moon.stars")
            Image(systemName: "moon.stars.fill")
            Image(systemName: "arrow.up.and.down.circle")
            Image(systemName: "arrow.up.and.down.circle.fill").resizable().frame(width: 50, height: 50, alignment: .center)

        }
    }
}

#if DEBUG
struct KBSystemImage_Previews : PreviewProvider {
    static var previews: some View {
        KBSystemImage()
    }
}
#endif
