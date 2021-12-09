//
//  ViewModel.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/04.
//

import SwiftUI
import Foundation

class Data: ObservableObject {
    //@ObservedObject var data: Data = .data
    private init(){ }
    static let data = Data()
    
    @Published var view = "title"
    @Published var menuBar = true
    @Published var userName = (a:"",b:"")
    @Published var kidsNum = (a:1,b:5)
}

class ViewModel: ObservableObject{
    @ObservedObject var data: Data = .data
    /// ゲーム設定画面で決めた設定
    let model = Setting.model
    
    @State var timerHandler : Timer?
    @State var gravity : Timer?
    
    ///    端末の画面の縦横の大きさを取得
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @Published var gameTime = 0
    ///    障害物の移動の可、不可 [1,2,3,4]
    @Published var moving = [false,false,false,false]
    
    ///    obstacle:障害物 の 座標*4[(x,y),(x,y),(x,y)...]
    @Published var obstacle:[(x: CGFloat, y: CGFloat)] = []
    ///  障害物の種類,大きさ
    ///  name:"cloud.rain.fill" 雨
    ///  name:"flame.fill" 過熱
    ///  name:"battery.100.bolt" 過充電
    @Published var obstacleData = (name:"flame.fill",w:CGFloat(60),h:CGFloat(60))
    /// 炎の揺れ、チャージの管理
    var counter:[(Bool,x:Int)] = []
    
    ///    スマホの場所[w,h]
    @Published var phone = [CGFloat(0),CGFloat(0)]
    ///   スマホの大きさ
    @Published var health = 3
    @Published var message = ""
    @Published var isPlay = false
    var count = 0
    var obNum = 4
//    var speed = CGFloat(2)
    
    
    func set() {
        let music = Audio()
        music.playMusic(order: "\(obstacleData.name)")
        for i in 0...3 {
            let position = (x: w, y: CGFloat(0))
            // obstacle配列に4つの障害物を追加
            obstacle.append(position)
            // 4つの障害物を右上にセット
            obstacle[i].x = w-30
            obstacle[i].y = 30
            counter.append((true, x: 0))
        }
        isPlay = true
        startTimer()
        addGravity()
    }
    
    func startTimer(){
        if let unwrapedTimerHandler = timerHandler{
            if unwrapedTimerHandler.isValid == true{
                return
            }
        }
        timerHandler = Timer.scheduledTimer(
            withTimeInterval: 1.0, repeats: true){ _ in
                self.gameTime += 1
            }
    }
    
    //    0.01秒毎に動くエンジン的なもの
    func addGravity(){
        if let unwrapedGravity = gravity{
            if unwrapedGravity.isValid == true{
                return
            }
        }
        gravity = Timer.scheduledTimer(
            withTimeInterval: 0.01, repeats: true){ _ in
                //self.gameTime -= 1
                if self.moving[0]{self.moveDown(num: 0)}
                if self.moving[1]{self.moveDown(num: 1)}
                if self.moving[2]{self.moveDown(num: 2)}
                if self.moving[3]{self.moveDown(num: 3)}
                self.judge()
            }
    }
    
    //    画面上にある障害物を下に移動させていく
    func moveDown(num: Int) {
        obstacle[num].y += model.fallingSpeed
        
        switch obstacleData.name {
        case "flame.fill":
            fireMove(num: num)
        case "battery.100.bolt":
            overChageMove(num: num)
        default:
            return
        }
        
        // 画面外にいくと再配置,停止
        if obstacle[num].y >= h+50{
            moving[num] = false
            obstacle[num].x = w-30
            obstacle[num].y = 30
            counter[num].0 = true
            obNum += 1
        }
    }
    
    func fireMove(num:Int) {
        counter[num].x += 1
        if counter[num].0 {
            // 左へ(counter[num].0 = true)
            obstacle[num].x -= 1
        } else {
            // 右へ(counter[num].0=false)
            obstacle[num].x += 1
        }
        if counter[num].x >= 50{
            counter[num].0.toggle()
            counter[num].x = 0
        }
    }
    
    func overChageMove(num:Int) {
        if counter[num].0 {
            // 上へ(counter[num].0 = true)
            counter[num].x += 1
            obstacle[num].y -= model.fallingSpeed+1
        } else {
            // 高速で下へ(counter[num].0=false)
            obstacle[num].y += model.fallingSpeed*4
        }
        if counter[num].x >= 100{
            counter[num].0.toggle()
            counter[num].x = 0
        }
    }
    
    //    画面上部をタップした時に
    //    タップした座標に障害物を置く
    func summon(x: CGFloat,y: CGFloat) {
        if obNum >= 1{
            self.moving[count]=true
            obstacle[count].x = x
            obstacle[count].y = y
            count += 1
            obNum -= 1
        }
        if count == 4{
            count = 0
        }
    }
    
    //    画像が重なるかどうか検知する
    func judge() {
        let wid = obstacleData.w/2 + model.iPhoneSize.w/2
        let hig = obstacleData.h/2 + model.iPhoneSize.h/2
        for i in 0...3 {
            if (obstacle[i].x-wid <= phone[0] && obstacle[i].x+wid >= phone[0])
                && (obstacle[i].y-hig <= phone[1] && obstacle[i].y+hig >= phone[1]){
                hit()
            }
        }
    }
    
    //  障害物が当たった時の処理
    
    func hit() {
        switch obstacleData.name {
        case "cloud.rain.fill": message = "雨にやられた"
        case "flame.fill": message = "端末熱々！！！"
        case "battery.100.bolt": message = "過充電してしまった。"
        default: message = "スマホを落としてしまった"
        }

        // 障害物全てを右上に移動し,停止
        for n in 0...3{
            obstacle[n].x = w-30
            obstacle[n].y = 30
            moving[n] = false
            counter[n] = (true, x: 0)
            obNum = 4
        }
        count = 0
        model.hitPoint -= 1
        if model.hitPoint <= 0 {
            gameOver()
        }
    }
    
    func gameOver() {
        Audio().stopMusic()
        timerHandler?.invalidate()
        gravity?.invalidate()
        message = "故障しました。"
        logManager().addlog(newLog: ["\(data.kidsNum.a)","\(model.userName1)","\(data.kidsNum.b)","\(model.userName2)",
                                     "\(gameTime)",model.iPhoneSize == (w:CGFloat(40),h:CGFloat(70)) ? "端末(小)" : "端末(大)","\(model.fallingSpeed)","aaa",obstacleData.name])
    }
}
