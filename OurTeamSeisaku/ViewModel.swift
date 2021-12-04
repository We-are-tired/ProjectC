//
//  ViewModel.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/04.
//

import SwiftUI
import Foundation

class Data: ObservableObject {
    private init(){ }
    static let data = Data()
    
    @Published var view = "title"
    @Published var menuBar = true
}


class ViewModel: ObservableObject{
    @ObservedObject var data: Data = .data
    @State var timerHandler : Timer?
    //    端末の画面の縦横の大きさを取得
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @Published var gameTime = 3000
    //    障害物の移動の可、不可 [1,2,3,4]
    @Published var moving = [false,false,false,false]
    //    obstacle:障害物 の 座標*4[(x,y),(x,y),(x,y)...]
    @Published var obstacle:[(x: CGFloat, y: CGFloat)] = []
    //    obstacleSize
    var obSize = [CGFloat(70),CGFloat(50)]
    //    スマホの場所[w,h]
    @Published var phone = [CGFloat(0),CGFloat(0)]
    @Published var health = 3
    
    @Published var message = ""
    @Published var isPlay = false
    var count = 0
    var obNum = 4
    var speed = CGFloat(2)
    
    
    func set() {
        for i in 0...3 {
            let position = (x: w, y: CGFloat(0))
            // obstacle配列に4つの障害物を追加
            obstacle.append(position)
            // 4つの障害物を右上にセット
            obstacle[i].x = w-30
            obstacle[i].y = 30
        }
        isPlay = true
        startTimer()
    }
    
    //    0.01秒毎に動くエンジン的なもの
    func startTimer(){
        if let unwrapedTimerHandler = timerHandler{
            if unwrapedTimerHandler.isValid == true{
                return
            }
        }
        timerHandler = Timer.scheduledTimer(
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
        obstacle[num].y += speed
        // 画面外にいくと再配置,停止
        if obstacle[num].y >= h+50{
            moving[num]=false
            obstacle[num].x = w-30
            obstacle[num].y = 30
            obNum += 1
        }
    }
    
    //    画面上部をタップした時に
    //    タップした座標に障害物を置く
    func summon(x: CGFloat,y: CGFloat) {
        count += 1
        if obNum >= 1{
            self.moving[count-1]=true
            obstacle[count-1].x = x
            obstacle[count-1].y = y
        }
        if count == 4{
            count = 0
        }
        obNum -= 1
    }
    
    //    画像が重なるかどうか検知する
    func judge() {
        let wid = obSize[0]/2 + 20
        let hig = obSize[1]/2 + 35
        print("judge")
        for i in 0...3 {
            if (obstacle[i].x-wid <= phone[0] && obstacle[i].x+wid >= phone[0])
                && (obstacle[i].y-hig <= phone[1] && obstacle[i].y+hig >= phone[1]){
                hit()
            }
        }
    }
    
    //  障害物が当たった時の処理
    func hit() {
        message = "雨にやられた"
        // 障害物全てを右上に移動し,停止
        for n in 0...3{
            obstacle[n].x = w-30
            obstacle[n].y = 30
            moving[n] = false
            obNum = 4
        }
        count = 0
        health -= 1
    }
}
