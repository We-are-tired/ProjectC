//
//  game1.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

struct game1: View {
    var body: some View {
        VStack{
            Text("一個めのゲーム")
                .font(.title)
            Text("２個めのゲームも兼任")
                .font(.title)
            Text("３個めのゲームも兼任")
                .font(.title)
            Text("忙しい。")
                .font(.title)
            Spacer().frame(height: 50)
            
            Button("戻る"){
                mainView().changeView(view: "home")
            }
                .font(.title)
        }
    }
}

struct game1_Previews: PreviewProvider {
    static var previews: some View {
        game1()
    }
}
