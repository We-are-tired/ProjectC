//
//  GameSetting.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/04.
//

import Foundation
import SwiftUI

// ViewModelから受け取って、ゲームのバトル画面?で取り出す
// いくつもいらないのでシングルトン
class Setting {
    static let model = Setting()
    /// オブジェクトの落下速度
    var fallingSpeed:CGFloat = 1
    /// 体力。アップルケアに加入すると増える？
    var hitPoint = 3
    /// オブジェクトを再度生成するまでの時間
    var coolTime = 5
    
    /// iPhoneの大きさ
    var iPhoneSize = 3
    
    private init() {
        //なにか処理あれば
    }
    
    // 落下速度の調整
    func adjusting(fallingSpeed: Int) {
        self.fallingSpeed = CGFloat(fallingSpeed)
        print(fallingSpeed)
    }
    
    // HPの調整
    func adjusting(hitPoint: Int) {
        self.hitPoint = hitPoint
        print(hitPoint)
    }
    
    // クールタイムの設定
    func adjusting(coolTime: Int) {
        self.coolTime = coolTime
        print(coolTime)
    }
    
    func adjusting(iPhoneSize: Int) {
        self.iPhoneSize = iPhoneSize
        print(iPhoneSize)
    }
    
}


