//
//  GameSetting.swift
//  BarrageGame
//
//  Created by cmStudent on 2021/11/29.
//

import SwiftUI

struct GameSetting: View {
    
//    @State private var iphoneBtn = true
//    @State private var gameSpeed = true
//    @State private var highCastTime = true
//    @State private var appleCare = true
    
//    @State private var viewModel.isiPhoneSize = true
//    @State private var viewModel.isSpeed = true
//    @State private var viewModel.isHighCastTime = true
//    @State private var viewModel.isAppleCare = true
    
    @ObservedObject var viewModel = GameSettingViewModel()
    
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
                    
                    Text(viewModel.isiPhoneSize ? "" : "")
                    Toggle("", isOn: $viewModel.isiPhoneSize)
                        .labelsHidden()
                }//Size
                
                VStack{
                    Text("　高速　")
                        .padding()
                    
                    Text(viewModel.isSpeed ? "" : "")
                    Toggle("", isOn: $viewModel.isSpeed)
                        .labelsHidden()
                }//Speed
                
                VStack{
                    Text(" CT減少 ")
                        .padding()
                    
                    Text(viewModel.isHighCastTime ? "" : "")
                    Toggle("", isOn: $viewModel.isHighCastTime)
                        .labelsHidden()
                }//CT
                
                
                VStack{
                    Text("Apple Care")
                        .padding()
                    
                    Text(viewModel.isAppleCare ? "" : "")
                    Toggle("", isOn: $viewModel.isAppleCare)
                        .labelsHidden()
                }//Apple Care
                
                
                Spacer()
                
                Button {
                    mainView().changeView(view: "Newton")
                } label: {
                    Text("スタート")
                        .font(.title)
                        .padding()
                }

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
