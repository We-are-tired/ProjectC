//
//  Newton.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/30.
//

import SwiftUI

struct Newton: View {
    @ObservedObject var move = ViewModel()
    @ObservedObject var data: Data = .data
    /// ゲーム設定画面で決めた設定
    let model = Setting.model
    //    端末の画面の縦横の大きさを取得
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    //    障害物の横幅、縦幅
    var obSize = [CGFloat(70),CGFloat(50)]
    
    var body: some View {
        ZStack{
            //  障害物出せる場所
            VStack{
                Image("blue")
                    .resizable()
                    .frame(width: w, height: h/4)
                    .gesture(DragGesture(minimumDistance: 0)
                                .onEnded({ (value) in
                        print(value.location.x)
                        print(value.location.y)
                        move.message = "あったてない"
                        move.summon(x: value.location.x,
                                    y: value.location.y)
                    }))
                Spacer()
            }
            
            //
            VStack{
                Text("\(move.obNum)/4")
                Text("\(move.message)")
                    .font(.title)
            }
            
            //　　障害物*4
            Group{
                if move.isPlay {
                    ForEach(0..<4) { i in
                        Image(systemName: "cloud.rain.fill")
                            .resizable()
                            .frame(width: obSize[0], height: obSize[1])
                        //.background(Color.red)
                            .position(x: move.obstacle[i].x, y: move.obstacle[i].y)
                    }
                }
            }
            
            //  iPhone
            Image(systemName: "iphone")
                .resizable()
                .frame(width: model.iPhoneSize.w, height: model.iPhoneSize.h)
            //.background(Color.green)
                .position(x: move.phone[0], y: move.phone[1])
            
            //  スライダー
            VStack{
                Spacer()
                
                Slider(value: $move.phone[0], in: 0...w)
                
                Spacer().frame(height: 20)
            }
            
            // 体力表示
            VStack{
                Spacer().frame(height: h/2)
                
                HStack{
                    Spacer()
                    Text("残り\(move.gameTime)秒")
                }
                
                HStack{
                    Spacer()
                    if move.health >= 3{Image(systemName:"heart")}
                    if move.health >= 2{Image(systemName:"heart")}
                    if move.health >= 1{Image(systemName:"heart")}
                }
                Spacer()
            }
            
        } // ZS
        
        .onAppear(){
            move.phone[0] = w/2
            move.phone[1] = h*0.8
            move.set()
        }
    }
}

struct Newton_Previews: PreviewProvider {
    static var previews: some View {
        Newton()
    }
}
