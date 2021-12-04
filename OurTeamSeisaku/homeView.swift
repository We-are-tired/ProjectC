//
//  homeView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

struct homeView: View {
    @State var mode = "るどー"
    var body: some View {
        ZStack{
            
//            ボタン
            VStack{
                Spacer().frame(height: 10)
                HStack{
                    Spacer()
                    Button("きろく"){
                        mainView().changeView(view: "log")
                    }
                        .font(.title)
                }
                Spacer()
                
                Button("遊ぶ"){
                    mainView().changeView(view: "Newton")
                }.font(.title)
                
//                Button("\(mode)で遊ぶ"){
//                    mainView().changeView(view: "game1")
//                }
//                    .font(.title)
//
//                HStack(spacing: 10){
//                    Image("rudo")
//                        .resizable()
//                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
//                        .onTapGesture {mode = "るどー"}
//                    Image("uno")
//                        .resizable()
//                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
//                        .onTapGesture {mode = "うの"}
//                    Image("poke")
//                        .resizable()
//                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
//                        .onTapGesture {mode = "p⚪︎kem⚪︎n"}
//                }
                Spacer().frame(height: 10)
            }
//            なめ
            VStack{
                HStack{
                    VStack{
                        Text("じぶん：(textFierd)")
                        Text("ともだち：(textFierd)")
                    }
                    Spacer()
                }
                Spacer()
            }
//            キッズ
            VStack{
                HStack{
                    Image("kids1")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    Text("＆")
                        .font(.title)
                        .bold()
                    
                    Image("kids2")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
