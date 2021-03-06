//
//  GameSetting.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/06.
//

import SwiftUI

struct GameSetting: View {
    @ObservedObject var viewModel = GameSettingViewModel()
    @ObservedObject var data: Data = .data
    
    var body: some View {
        ZStack{
            Image("Setting_pic")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Spacer()
                    Text("きろく")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .onTapGesture {mainView().changeView(view: "log")}
                }
                Spacer()
            }
            
            HStack{//ユーザーの横並び
                ///左側のユーザー（初期値は落とす側）
                VStack(spacing:15){
                    VStack{
                        Button{
                            //タップでユーザー画像の変更を行う想定
                            //data.kidsNum.a -> 1~8
                            if(data.kidsNum.a == 8){
                                data.kidsNum.a = 1
                            }else{
                                data.kidsNum.a += 1
                            }
                        }label:{
                            //以下のアイコンは画像に変更予定。仮置きのSFシンボル。
                            Image("kids\(data.kidsNum.a)")
                                .resizable()
                            //アイコン画像のサイズ調整(50~60 -> 80へ)
                                .frame(width: 80, height: 80)
                                .padding()
                                .background(Color.white)
                        }//ユーザー1のボタン
                        
                        TextField("ユーザー1", text: $data.userName.a)
                            .padding()
                            .background(Color.white)
                        
                        Spacer().frame(height:50)
                        
                    }//VStack(ユーザー1全般)
                    
                    VStack{
                        Text("障害物")
                            .padding(2.0)
                            .background(Color.white)
                        
                        HStack(spacing:5){
                            Button{
                                //enemyItemsの画像切り替え（左）
                                if(viewModel.itemsArray < viewModel.enemyItems.count - 1) {
                                    viewModel.itemsArray += 1
                                } else {
                                    viewModel.itemsArray = 0
                                }
                            }label:{
                                Text("←")
                                    .padding(5)
                                    .background(Color.white)
                            }//障害物・左のボタン
                            
                            //障害物のアイコン
                            Image(systemName:"\(viewModel.enemyItems[viewModel.itemsArray])")
                                .resizable()
                                .frame(width: 60, height: 50)
                                .padding()
                                .background(Color.white)
///アイコンに障害物のサイズ(model.enemySize.w/model.enemySize.w作った後)適応おね
                            Button{
                                //enemyItemsの画像切り替え（右）
                                if(viewModel.itemsArray > 0) {
                                    viewModel.itemsArray -= 1
                                } else {
                                    viewModel.itemsArray = viewModel.enemyItems.count - 1
                                }

                            }label:{
                                Text("→")
                                    .padding(5)
                                    .background(Color.white)
                            }//障害物・右のボタン
                        }//HStack(障害物ボタン全般)
                        
                        Spacer().frame(height:50)
                        
                    }//VStack(障害物)
                    
                    VStack{
                        Text("速度")
                            .padding(2.0)
                            .background(Color.white)
                        
                        HStack(spacing:10){
                            Button{
                                viewModel.itemsSpeed -= 1
                                
                                if(viewModel.itemsSpeed < 1){
                                    //速度を1以下にしない処理
                                    viewModel.itemsSpeed = 1
                                }
                            }label:{
                                Text("←")
                                    .padding(5)
                                    .background(Color.white)
                            }//速度・左のボタン
                            
                            Text("\(viewModel.itemsSpeed)")
                                .padding()
                                .background(Color.white)
                            
                            Button{
                                viewModel.itemsSpeed += 1
                                
                                if(viewModel.itemsSpeed > 5){
                                    viewModel.itemsSpeed = 5
                                }
                            }label:{
                                Text("→")
                                    .padding(5)
                                    .background(Color.white)
                            }//速度・右のボタン
                        }//速度ボタン全般
                        
                        Spacer().frame(height:80)
                        
                    }//VStack(Speed)
                }//VStack(User_All:左側)
                
                //ユーザー同士のスペース
                Spacer().frame(width:60)
                
                ///右側のユーザー（初期値は避ける側）
                VStack{
                    VStack{
                        Button{
                            //タップでユーザー画像の変更を行う想定
                            //data.kidsNum.b -> 1~8
                            if(data.kidsNum.b == 8){
                                data.kidsNum.b = 1
                            }else{
                                data.kidsNum.b += 1
                            }

                        }label:{
                            //以下のアイコンは画像に変更予定。仮置きのSFシンボル。
                            Image("kids\(data.kidsNum.b)")
                                .resizable()
                            //アイコン画像のサイズ調整(50~60 -> 80へ)
                                .frame(width: 80, height: 80)
                                .padding()
                                .background(Color.white)
                        }//ユーザー2の画像
                        
                        TextField("ユーザー2", text: $data.userName.b)
                            .padding()
                            .background(Color.white)
                        
                        Spacer().frame(height:50)
                    }//VStack（ユーザー2全般）
                    
                    VStack{
                        Text(viewModel.isiPhoneSize ? "iPhone mini" : "iPhone Pro")
                            .padding(2.0)
                            .background(Color.white)
                        
                        HStack(spacing:15){
                            ZStack {
                                ZStack {
                                    Image(systemName:"\(viewModel.iphoneItems)")
                                        .resizable()
                                        .frame(width: 50, height: 75)
                                        .padding()
                                        .background(Color.white)
///iPhoneのsfSymbol(iPhone.homebutton/iPhone)とサイズ適応おね
                                }
                                HStack {
                                if viewModel.isiPhoneSize == true {
                                    Button{
                                        //端末の大きさを変える処理
                                        viewModel.isiPhoneSize = false
                                        viewModel.iphoneItems = "iphone"
                                    }label:{
                                        Text("←")
                                            .padding(5)
                                            .background(Color.white)
                                        
                                    }
                                } else {
                                    Spacer()
                                        
                                }
                                Spacer()
                                    .padding()
                            
                                if viewModel.isiPhoneSize == false {
                                    Button{
                                        //端末の大きさを変える処理
                                        viewModel.isiPhoneSize = true
                                        viewModel.iphoneItems = "iphone.homebutton"
                                    }label:{
                                        Text("→")
                                            .padding(5)
                                            .background(Color.white)
                                    }
                                } else {
                                    Spacer()
                                    
                                }
                                }
                            }
                        }
                        
                        Spacer().frame(height:65)
                        
                    }//VStack(Size)
                    
                    VStack(spacing:10){
                        Text("Apple Care")
                            .padding(2.0)
                            .background(Color.white)
                        
                        Text(viewModel.isAppleCare ? "" : "")
                        Toggle("", isOn: $viewModel.isAppleCare)
                            .labelsHidden()
                        
                        Spacer().frame(height:50)
                        
                    }//VStack(Apple Care)
                }//VStack(User_All:右側)
                
            }//HStack（2人のユーザー横並び）
            .padding()
            
            VStack{
                
//                //入替ボタン(画面一番上)
//                Button{
//                    //ユーザー同士を入れ替える処理
//                }
//            label:{
//                Image(systemName: "repeat")
//                    .resizable()
//                    .frame(width: 55, height: 55)
//                    .padding()
//                    .background(Color.white)
//            }
                
                Spacer()
                
                //スタートボタン（画面一番下）
                Button {
                    viewModel.settings()
                    mainView().changeView(view: "Newton")
                } label: {
                    Text("Let's Play !")
                        .font(.title)
                        .padding()
                        .background(Color.white)
                        .border(Color.black)
                }
                Spacer().frame(height:20)
            }//Button(スタート：一番下に設置)
        }//ZStack(背景)
    }//body
}//GameSetting

struct GameSetting_Previews: PreviewProvider {
    static var previews: some View {
        GameSetting()
    }//previews
}//GameSetting_Previews
