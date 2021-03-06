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
//    @Published var isSpeed = true
    @Published var isAppleCare = true
    @Published var isiPhoneSize = true
    @Published var isHighCastTime = true
    
    //  設定画面(TwoUserSetting.swift)における変更に伴い、以下を追加
    @Published var enemyItems = ["cloud.rain.fill","flame.fill","battery.100.bolt"]
    @Published var itemsArray = 0
    //障害物（flame.fill、cloud.rain.fill、battery.100.boltで切り替え）
//        @Published var iphoneName = "端末(小)" //端末名
        @Published var iphoneItems = "iphone.homebutton" //端末のアイコン（iphoneと切り替え）
        @Published var itemsSpeed = 1 //落下速度のレベル

    let model = Setting.model
    
    //FIXME: なおす
    func settings() {
        print(itemsSpeed, isiPhoneSize, isAppleCare, isHighCastTime)
        
        model.setEnemy(enemy: enemyItems[itemsArray])
///enemySize作って！
        model.adjusting(fallingSpeed: itemsSpeed)
        model.adjusting(hitPoint: isAppleCare ? 3 : 2)
        model.adjusting(iPhoneSize: isiPhoneSize ? (w:CGFloat(40),h:CGFloat(70)) :
                            (w:CGFloat(30),h:CGFloat(50)))
    }
    
}
