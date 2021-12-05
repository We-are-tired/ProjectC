//
//  GameSetting.swift
//  BarrageGame
//
//  Created by cmStudent on 2021/11/29.
//

import SwiftUI

struct GameSetting: View {
    
    @State private var iphoneBtn = true
    @State private var gameSpeed = true
    @State private var highCastTime = true
    @State private var appleCare = true
    
    @State private var iphoneBtn2 = true
    @State private var gameSpeed2 = true
    @State private var highCastTime2 = true
    @State private var appleCare2 = true
    
    var body: some View {
        
        //HStack{時間設定を横に出す時に必要になる
            VStack{//引数エラーが起こるため、VStack多め。
                
                Spacer()
                
                VStack{
                    Image(systemName:"person")
                        .resizable()
                        .frame(width: 55, height: 55)
                    
                    Text("Iphone ユーザー")
                    
                }//User
                
                VStack{
                    Text("端末(小)")
                        .padding()
                    
                    //Sample
                    //Text(iphoneBtn2 ? "ON" : "OFF")
                    //Toggle("", isOn: $iphoneBtn2)
                    //    .labelsHidden()
                    
                    Text(iphoneBtn2 ? "" : "")
                    Toggle("", isOn: $iphoneBtn2)
                        .labelsHidden()
                }//Size
                
                VStack{
                    Text("　高速　")
                        .padding()
                    
                    Text(gameSpeed2 ? "" : "")
                    Toggle("", isOn: $gameSpeed2)
                        .labelsHidden()
                }//Speed
                
                VStack{
                    Text(" CT減少 ")
                        .padding()
                    
                    Text(highCastTime2 ? "" : "")
                    Toggle("", isOn: $highCastTime2)
                        .labelsHidden()
                }//CT
                
                
                VStack{
                    Text("Apple Care")
                        .padding()
                    
                    Text(appleCare2 ? "" : "")
                    Toggle("", isOn: $appleCare2)
                        .labelsHidden()
                }//Apple Care
                
                
                Spacer()
                
                Text("スタート")
                    .font(.title)
                    .padding()
                
            }//VStack(All)
            
            /*時間設定用のスクリーン------------------------*/
            //            VStack{
            //
            //            Text("時間")
            //                .font(.title)
            //                .padding()
            //
            //            HStack{
            //                Text("30")
            //
            //                Text("60")
            //
            //                Text("無限")
            //            }//HStack(30, 60, FreeTime)
            //
            //                Text("先攻")
            //                    .padding()
            //
            //                HStack{
            //                    Text("プレイヤー1")
            //                    Text("プレイヤー2")
            //                }
            //
            //                Spacer()
            //            }VStack(TimeSetting Screen)
            /*-------------------------------------------*/
            
        //}//HStack(All + Time)
    }//body
}//GameSetting

struct GameSetting_Previews: PreviewProvider {
    static var previews: some View {
        GameSetting()
    }//previews
}//GameSetting_Previews
