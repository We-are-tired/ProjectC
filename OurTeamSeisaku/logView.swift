//
//  logView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

struct logView: View {
    @State var mode = "うの"
    var body: some View {
        ZStack{
//            ボタンなど
            VStack{
                Spacer().frame(height: 10)
                HStack{
                    Spacer()
                    Button("戻る"){
                        mainView().changeView(view: "home")
                    }
                        .font(.title)
                }
                Text("\(mode)の記録")
                    .font(.largeTitle)
                
                Spacer()
                
                logs()
                
                Spacer()
                
                HStack(spacing: 10){
                    Image("rudo")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                        .onTapGesture {mode = "るどー"}
                    Image("uno")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                        .onTapGesture {mode = "うの"}
                    Image("poke")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                        .onTapGesture {mode = "p⚪︎kem⚪︎n"}
                }
                Spacer().frame(height: 10)
            }
        }
    }
}

struct logs: View {
    var body: some View {
        VStack{
            Group{
                Text("名前１ vs 名前2")
                Text("名前１ vs 名前2")
                Text("名前１ vs 名前2")
                Text("名前１ vs 名前2")
                Text("名前１ vs 名前2")
            }.font(.title2)
            .padding()
            .border(Color.black)
        }
    }
}
    
struct logView_Previews: PreviewProvider {
    static var previews: some View {
        logView()
    }
}
