//
//  titleView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

struct titleView: View {
    @ObservedObject var dt: Data = .data
    var body: some View {
        ZStack{
            VStack{
                Group{
                HStack{
                    Text("おともだち")
                        .font(.largeTitle)
                        .bold()
                    Text("と")
                        .font(.title)
                        .bold()
                }
                Text("いっしょ")
                    .font(.largeTitle)
                    .bold()
                }.padding()
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                
                ///ロゴの調整おね
                
                Spacer().frame(height: 100)
                
                Button("はい。"){
                    mainView().changeView(view: "Setting")
                }.font(.title3)
                ///ボタンの装飾おね
            }
        }
    }
}

struct titleView_Previews: PreviewProvider {
    static var previews: some View {
        titleView()
    }
}
