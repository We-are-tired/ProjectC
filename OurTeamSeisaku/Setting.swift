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
    
    /// 降ってくるオブジェクト
    var enemyItem = "battery.100.bolt"
    /// iPhoneの大きさ
    var iPhoneSize = (w:CGFloat(70),h:CGFloat(70))
    
    var userName1 = ""
    var userName2 = ""
    var enemySize = (w:CGFloat(70),h:CGFloat(30))
    
    private init() {
        //なにか処理あれば
    }
    
    // ユーザー名の決定
    func setUsersName(userName1:String, userName2:String) {
        self.userName1 = userName1
        self.userName2 = userName2
    }
    
    func setEnemy(enemy:String) {
            self.enemyItem = enemy
            switch enemy {
            case "cloud.rain.fill":
                self.enemySize = (w:CGFloat(70),h:CGFloat(50))
            case "flame.fill":
                self.enemySize = (w:CGFloat(60),h:CGFloat(60))
            case "battery.100.bolt":
                self.enemySize = (w:CGFloat(70),h:CGFloat(30))
            default:
                //ここに何か入ることはない
                break
            }
        }
///enemySize作って！
    
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
    
    func adjusting(iPhoneSize: (w:CGFloat,h:CGFloat)) {
        self.iPhoneSize = iPhoneSize
        print(iPhoneSize)
    }
    
}


