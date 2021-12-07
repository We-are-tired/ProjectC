//
//  resultView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/12/07.
//

import SwiftUI

struct resultView: View {
    @State var data = []
    var body: some View {
        ZStack{
            VStack{
                // ViewModel 211 行の内容をうまく並べてくだせえ
                //["kids1の(数字)","ユーザー名１","kids2の(数字)","ユーザー名２","\(gameTime)","phoneNaem","Applecare"]
                Button("戻る"){                    
                    mainView().changeView(view: "Setting")
                }.font(.title3)
            }
        }.onAppear(){
            // dataに今回の記録を代入
            // 今回の記録はViewModel209行で追加してる
            data = logManager().getLog()[0]
        }
    }
}

struct resultView_Previews: PreviewProvider {
    static var previews: some View {
        resultView()
    }
}
