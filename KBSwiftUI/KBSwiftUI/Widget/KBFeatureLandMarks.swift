//
//  KBFeatureLandMarks.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/21.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI

struct KBFeatureLandMarks : View {
     var feature:KBLandmark
    var body: some View {
        feature.image(forSize: 250).resizable()
    }
}
