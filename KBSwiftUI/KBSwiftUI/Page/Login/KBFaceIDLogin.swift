//
//  KBFaceIDLogin.swift
//  KBSwiftUI
//
//  Created by 金灵波 on 2019/6/26.
//  Copyright © 2019 金灵波. All rights reserved.
//

import Foundation
import LocalAuthentication

enum KBFaceID{
    case success(String)
    case failure(String)
}

final class KBFaceIDLogin {
    static func login(result:@escaping (KBFaceID)->Void)  {
       let message = "面容ID 时间内失败多次，请使用密码登录"
        
        let deviceType = kLAPolicyDeviceOwnerAuthenticationWithBiometrics
        
        let laContext  = LAContext()
        laContext.localizedFallbackTitle = "FaceID" // 隐藏左边的按钮(默认是忘记密码的按钮)
        guard let policy = LAPolicy(rawValue: Int(deviceType)) else {
            return result(KBFaceID.failure("LAPolicy error"))
        }
        var  error :NSError? = nil
        let  isSupport = laContext.canEvaluatePolicy(policy, error: &error)
        if isSupport {
            
            laContext.evaluatePolicy(policy, localizedReason: message) { (success, error1) in
                if success {
                    result(KBFaceID.success("succes"))

                }else {
                    result(KBFaceID.failure(error1!.localizedDescription))
                }
            }
        }else {
            result(KBFaceID.failure(error!.localizedDescription))
        }        
    }
}
