//
//  ContentView.swift
//  BarrageGame
//
//  Created by cmStudent on 2021/11/29.
//

import SwiftUI

struct ContentView: View {
    @State var slaiderValue:Double = 0
    @State private var textAct = false
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
        
        VStack{
            Image(systemName:"cloud.rain.fill")
                .resizable()
                .frame(width: 55, height: 55)
            
            Spacer()
            
            HStack{
                Spacer()
                Text("残り" + "秒")
            }
            
            HStack{
                Spacer()
                Image(systemName:"heart")
                Image(systemName:"heart")
                Image(systemName:"heart")
            }
            
            Spacer()
            
            //デバッグ用のText
            Text("現在の値：\(slaiderValue)")
                .padding()
            
            //自機操作用のスライダー
            Slider(value: $slaiderValue,
                   in: 0...100,
                   step: 0.1,
                   onEditingChanged: {
                bool in self.textAct = bool
            }//onEditingChanged
            )//Slider
        }//HStack
        }//ZStack
    }//body
}//ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }//previews
}//ContentView_Previews
