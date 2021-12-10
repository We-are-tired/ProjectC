//
//  resultView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/07.
//

import SwiftUI

//ほぼlogViewの流用であるため、詳細はそちらを参照してほしい。
//logs -> resultlogs
//logManager -> resultlogManager
//getSaveLog() -> resultgetSavedLog()
//addlog() -> resultaddlog()
//上記のように部分的に名前を変更している部分有り。

struct resultView: View {
    @State var data = []
    var body: some View {
        ZStack{
            VStack{
                // ViewModel:211行の内容をうまく並べて
                //data =["kids1の(数字)","ユーザー名１","kids2の(数字)","ユーザー名２",
                //"\(gameTime)","phoneNaem","落ちる速度","Applecare(ON/OFF)","障害物の名前"]
                
                Spacer()
                
                ForEach(1..<2){
                    num in resultlogs(num: num)
                }
                
                Spacer()
                
                Button("戻る"){
                    mainView().changeView(view: "Setting")
                }//Button
                .font(.title3)
            }//VStack
        }//ZStack
        .onAppear(){
            // dataに今回の記録を代入
            // 今回の記録はViewModel:209行で追加してる
            data = logManager().getLog()[0]
        }
    }
}

struct resultlogs:View{
    let num: Int
    @State var allLog:[[String]] = []
    @State var log:[String] = ["","","","","","","","",""]
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Image("kids\(log[0])")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text(log[1])
                }//VStack(P1 + name)縦並び
                
                Text("VS")
                    .font(.title2)
                
                VStack{
                    Image("kids\(log[2])")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text(log[3])
                }//VStack(P2 + name)縦並び
            }//HStack (P1+name VS P2+name)という並びのイメージ、これと「時間」を強調表示させて縦並び、他は大きさを小さめなままで並ばせるだけのイメージ
            
            VStack{
                Text("時間\(log[4])")
                    .font(.title)
                    .padding()
                
                //端末の大きさ（「端末（小）」などで記述されるため、呼称をなしにしている）
                Text("\(log[5])")
                Text("速度\(log[6])")
                Text("AppleCare\(log[7])")
            }//VStack(時間などの情報一覧)
            
            Image(log[8])
                .resizable()
                .frame(width: 50, height: 50)
        }//HStack
        .onAppear(){
            allLog = logManager().getLog()
            log = allLog[0]
        }//onAppear
    }//resultlogs - body
}//resultlogs - Biew

struct resultView_Previews: PreviewProvider {
    static var previews: some View {
        resultView()
    }
}


