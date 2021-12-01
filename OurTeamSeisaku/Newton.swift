//
//  Newton.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/30.
//

import SwiftUI

struct Newton: View {
    @State var timerHandler : Timer?
//    端末の画面の縦横の大きさを取得
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
//    障害物の移動の可、不可 [1,2,3,4,5]
    @State var moving = [false,false,false,false,false]
//    obstacle:障害物    [x,y]
    @State var obstacle1 = [CGFloat(50),CGFloat(0)]
    @State var obstacle2 = [CGFloat(100),CGFloat(0)]
    @State var obstacle3 = [CGFloat(150),CGFloat(0)]
    @State var obstacle4 = [CGFloat(200),CGFloat(0)]
    @State var obstacle5 = [CGFloat(250),CGFloat(0)]
//    obstacleSize
    var obSize = [CGFloat(70),CGFloat(50)]
//    スマホの場所[w,h]
    @State var phone = [CGFloat(0),CGFloat(0)]
    
    @State var CT = false
    @State var time = 0
    @State var count = 0
    @State var message = ""
    let aa = CGFloat(2)
    var body: some View {
//    障害物の縦横[w,h]
        ZStack{
            
            VStack{
                Image("blue")
                    .resizable()
                    .frame(width: w, height: h/3)
                    .gesture(DragGesture(minimumDistance: 0)
                                .onEnded({ (value) in
                                    print(value.location.x)
                                    print(value.location.y)
                                    if !CT{
                                        message = "あったてない"
                                        summon(x: value.location.x,
                                               y: value.location.y)
                                    }}))
                Spacer()
            }
            
            VStack{
                Text("\(message)")
                    .font(.title)
                Text("\(50 - time)")
                    .font(.title)
                    .border(Color.black)
            }
            
//            障害物たち
            Group{
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: obSize[0], height: obSize[1])
                    .background(Color.red)
                    .position(x: obstacle1[0], y: obstacle1[1])
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: obSize[0], height: obSize[1])
                    .background(Color.red)
                    .position(x: obstacle2[0], y: obstacle2[1])
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: obSize[0], height: obSize[1])
                    .background(Color.red)
                    .position(x: obstacle3[0], y: obstacle3[1])
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: obSize[0], height: obSize[1])
                    .background(Color.red)
                    .position(x: obstacle4[0], y: obstacle4[1])
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: obSize[0], height: obSize[1])
                    .background(Color.red)
                    .position(x: obstacle5[0], y: obstacle5[1])
            }
            
            Image(systemName: "iphone")
                .resizable()
                .frame(width: 40, height: 70)
                .background(Color.green)
                .position(x: phone[0], y: phone[1])
            
            VStack{
//                サンプル用のボタン
                HStack{
                    Button("1"){moving[0].toggle()
                        obstacle1[1] = 0
                    }
                    Button("2"){moving[1].toggle()
                        obstacle2[1] = 0
                    }
                    Button("3"){moving[2].toggle()
                        obstacle3[1] = 0
                    }
                    Button("4"){moving[3].toggle()
                        obstacle4[1] = 0
                    }
                    Button("5"){moving[4].toggle()
                        obstacle5[1] = 0
                    }
                }
                
               Spacer()
                
                Slider(value: $phone[0], in: 0...w)
            }
        }.onAppear(){
            phone[0] = w/2
            phone[1] = h-150
            startTimer()
        }
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
            if CT {
                CoolTime()
            }
            if moving[0]{moveDown(num: 1)}
            if moving[1]{moveDown(num: 2)}
            if moving[2]{moveDown(num: 3)}
            if moving[3]{moveDown(num: 4)}
            if moving[4]{moveDown(num: 5)}
            judge()
        }
    }
//    画面上にある障害物を下に移動させていく
    func moveDown(num: Int) {
        if num == 1 {obstacle1[1]+=aa}
        if num == 2 {obstacle2[1]+=aa}
        if num == 3 {obstacle3[1]+=aa}
        if num == 4 {obstacle4[1]+=aa}
        if num == 5 {obstacle5[1]+=aa}
    }
//    画面上部をタップした時に
//    タップした座標に障害物を置く
    func summon(x: CGFloat,y: CGFloat) {
        count += 1
        time = 0
        if count == 1 {
            moving[0]=true
            obstacle1[0] = x
            obstacle1[1] = y
        }
        if count == 2 {
            moving[1]=true
            obstacle2[0] = x
            obstacle2[1] = y
        }
        if count == 3 {
            moving[2]=true
            obstacle3[0] = x
            obstacle3[1] = y
        }
        if count == 4 {
            moving[3]=true
            obstacle4[0] = x
            obstacle4[1] = y
        }
        if count == 5 {
            moving[4]=true
            obstacle5[0] = x
            obstacle5[1] = y
            count = 0
        }
        CT = true
    }
//    クールタイム
    func CoolTime() {
        time += 1
        if time == 50 {
            CT = false
        }
    }
//    画像が重なるかどうか検知する
    func judge() {
        let wid = obSize[0]/2 + 20
        let hig = obSize[1]/2 + 35
        if (obstacle1[0]-wid <= phone[0] && obstacle1[0]+wid >= phone[0])
            && (obstacle1[1]-hig <= phone[1] && obstacle1[1]+hig >= phone[1])
        {
            hit()
        }
        if (obstacle2[0]-wid <= phone[0] && obstacle2[0]+wid >= phone[0])
            && (obstacle2[1]-hig <= phone[1] && obstacle2[1]+hig >= phone[1])
        {
            hit()
        }
        if (obstacle3[0]-wid <= phone[0] && obstacle3[0]+wid >= phone[0])
            && (obstacle3[1]-hig <= phone[1] && obstacle3[1]+hig >= phone[1])
        {
            hit()
        }
        if (obstacle4[0]-wid <= phone[0] && obstacle4[0]+wid >= phone[0])
            && (obstacle4[1]-hig <= phone[1] && obstacle4[1]+hig >= phone[1])
        {
            hit()
        }
        if (obstacle5[0]-wid <= phone[0] && obstacle5[0]+wid >= phone[0])
            && (obstacle5[1]-hig <= phone[1] && obstacle5[1]+hig >= phone[1])
        {
            hit()
        }
    }
    func hit() {
        message = "あったた"
        obstacle1[1] = 0
        obstacle2[1] = 0
        obstacle3[1] = 0
        obstacle4[1] = 0
        obstacle5[1] = 0
        
        obstacle1[0] = 0
        obstacle2[0] = 0
        obstacle3[0] = 0
        obstacle4[0] = 0
        obstacle5[0] = 0
        moving = [false,false,false,false,false]
        count = 0
    }
}

struct Newton_Previews: PreviewProvider {
    static var previews: some View {
        Newton()
    }
}
