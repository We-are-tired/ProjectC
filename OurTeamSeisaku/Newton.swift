//
//  Newton.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/30.
//

import SwiftUI

struct Newton: View {
    @State var timerHandler : Timer?
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    @State var moving = [false,false,false,false,false]
    @State var enemy1 = [CGFloat(50),CGFloat(0)]
    @State var enemy2 = [CGFloat(100),CGFloat(0)]
    @State var enemy3 = [CGFloat(150),CGFloat(0)]
    @State var enemy4 = [CGFloat(200),CGFloat(0)]
    @State var enemy5 = [CGFloat(250),CGFloat(0)]
    @State var CT = false
    @State var time = 0
    @State var count = 0
    @State var phone = [CGFloat(0),CGFloat(0)]
    var aa = CGFloat(2)
    var body: some View {
        ZStack{
            
            VStack{
                Image("blue")
                    .resizable()
                    .frame(width: w, height: h/3)
                    .gesture(DragGesture(minimumDistance: 0)
                                .onEnded({ (value) in
                                    print(value.location.x)
                                    if !CT{
                                        summon(x: value.location.x)
                                    }
                                }))
                Spacer()
            }
            
            VStack{
                Text("\(50 - time)")
                    .font(.title)
                    .border(Color.black)
            }
            
//            障害物たち
            Group{
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: 100, height: 70)
                    .position(x: enemy1[0], y: enemy1[1])
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: 100, height: 70)
                    .position(x: enemy2[0], y: enemy2[1])
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: 100, height: 70)
                    .position(x: enemy3[0], y: enemy3[1])
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: 100, height: 70)
                    .position(x: enemy4[0], y: enemy4[1])
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: 100, height: 70)
                    .position(x: enemy5[0], y: enemy5[1])
            }
            
            Image(systemName: "iphone")
                .resizable()
                .frame(width: 40, height: 70)
                .position(x: phone[0], y: h-150)
            
            VStack{
//                サンプル用のボタン
                HStack{
                    Button("1"){moving[0].toggle()
                        enemy1[1] = 0
                    }
                    Button("2"){moving[1].toggle()
                        enemy2[1] = 0
                    }
                    Button("3"){moving[2].toggle()
                        enemy3[1] = 0
                    }
                    Button("4"){moving[3].toggle()
                        enemy4[1] = 0
                    }
                    Button("5"){moving[4].toggle()
                        enemy5[1] = 0
                    }
                }
                
               Spacer()
                
                Slider(value: $phone[0], in: 0...w)
            }
        }.onAppear(){
            phone[0] = w/2
            startTimer()}
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
        }
    }
    
    func moveDown(num: Int) {
        if num == 1 {enemy1[1]+=aa}
        if num == 2 {enemy2[1]+=aa}
        if num == 3 {enemy3[1]+=aa}
        if num == 4 {enemy4[1]+=aa}
        if num == 5 {enemy5[1]+=aa}
    }
    
    func summon(x: CGFloat) {
        count += 1
        time = 0
        if count == 1 {
            moving[0]=true
            enemy1[0] = x
            enemy1[1] = 0
        }
        if count == 2 {
            moving[1]=true
            enemy2[0] = x
            enemy2[1] = 0
        }
        if count == 3 {
            moving[2]=true
            enemy3[0] = x
            enemy3[1] = 0
        }
        if count == 4 {
            moving[3]=true
            enemy4[0] = x
            enemy4[1] = 0
        }
        if count == 5 {
            moving[4]=true
            enemy5[0] = x
            enemy5[1] = 0
            count = 0
        }
        CT = true
    }
    
    func CoolTime() {
        time += 1
        if time == 50 {
            CT = false
        }
    }
}

struct Newton_Previews: PreviewProvider {
    static var previews: some View {
        Newton()
    }
}
