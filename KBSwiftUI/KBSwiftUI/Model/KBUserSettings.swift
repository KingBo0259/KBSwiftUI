//
//  KBUserSettings.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/19.
//  Copyright © 2019 金灵波. All rights reserved.
//

import SwiftUI
import Combine

class KBUserSettings : BindableObject {
    var didChange = PassthroughSubject<Void, Never>();
    var score = 0 {
        didSet {
            didChange.send(())
        }
    }
}


