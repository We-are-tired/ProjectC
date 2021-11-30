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
        
        HStack{
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    VStack{
                        Image(systemName:"person")
                            .resizable()
                            .frame(width: 55, height: 55)
                        
                        Text("プレイヤー1")
                            .padding()
                        
                        Text("①くも")
                        Text("②バッテリー")
                    }//VStack(Player1)
                    
                    Text("VS")
                        .padding()
                    
                    VStack{
                        Image(systemName:"person.fill")
                            .resizable()
                            .frame(width: 55, height: 55)
                        
                        Text("プレイヤー2")
                            .padding()
                        
                        Text("①ほのお")
                        Text("②くも")
                    }//VStack(Player2)
                }//HStack
                
                VStack{
                    
                    HStack{
                        Text(iphoneBtn ? "ON" : "OFF")
                        Toggle("", isOn: $iphoneBtn)
                            .labelsHidden()
                            .padding()
                        
                        
                        Text("端末(小)")
                            .padding()
                        
                        
                        Text(iphoneBtn2 ? "ON" : "OFF")
                        Toggle("", isOn: $iphoneBtn2)
                            .labelsHidden()
                            .padding()
                        
                    }//HStack(iphoneBtn)
                    
                    HStack{
                        Text(gameSpeed ? "ON" : "OFF")
                        Toggle("", isOn: $gameSpeed)
                            .labelsHidden()
                            .padding()
                        
                        
                        Text("　高速　")
                            .padding()
                        
                        
                        Text(gameSpeed2 ? "ON" : "OFF")
                        Toggle("", isOn: $gameSpeed2)
                            .labelsHidden()
                            .padding()
                        
                    }//HStack(gameSpeed)
                    
                    HStack{
                        Text(highCastTime ? "ON" : "OFF")
                        Toggle("", isOn: $highCastTime)
                            .labelsHidden()
                            .padding()
                        
                        
                        Text(" CT減少 ")
                            .padding()
                        
                        
                        Text(highCastTime2 ? "ON" : "OFF")
                        Toggle("", isOn: $highCastTime2)
                            .labelsHidden()
                            .padding()
                        
                    }//HStack(highCastTime)
                    
                    HStack{
                        Text(appleCare ? "ON" : "OFF")
                        Toggle("", isOn: $appleCare)
                            .labelsHidden()
                            .padding()
                        
                        
                        Text(" Apple Care  ")
                        
                        
                        Text(appleCare2 ? "ON" : "OFF")
                        Toggle("", isOn: $appleCare2)
                            .labelsHidden()
                            .padding()
                        
                    }//HStack(appleCare)
                    
                }//VStack(Toggle)
                
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
/*----------------------------------------------*/
            
        }//HStack(All + Time)
    }//body
}//GameSetting

struct GameSetting_Previews: PreviewProvider {
    static var previews: some View {
        GameSetting()
    }//previews
}//GameSetting_Previews
