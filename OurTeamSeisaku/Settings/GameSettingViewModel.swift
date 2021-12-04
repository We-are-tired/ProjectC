//
//  GameSettingViewModel.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/04.
//

import Foundation
import SwiftUI

// FIXME:多分だけど全ての引数がbool。書き直し
class GameSettingViewModel: ObservableObject {
    // Intなのか？
    @Published var fallingSpeed: CGFloat
    @Published var hitPoint: Int
    let model = Setting.model
    
    init() {
        self.fallingSpeed = model.fallingSpeed
        self.hitPoint = model.hitPoint
    }
    
    // スピードを設定する。引数にはInt?何が来るのかわからないので
    func settingsSpeed(is speed: Int) {
        // イコールじゃなくてOK
        model.adjusting(fallingSpeed: speed)
    }
    
    func settingCoolTime(is time: Int) {
        model.adjusting(coolTime: time)
    }
    
    func appleCare(isJoining: Bool) {
        if isJoining {
            model.adjusting(hitPoint: 3)
        } else {
            model.adjusting(hitPoint: 2)
        }
    }
    
    
}
