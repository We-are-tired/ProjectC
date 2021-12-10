//
//  titleView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

struct titleView: View {
    @ObservedObject var dt: Data = .data
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    var body: some View {
        ZStack{
            VStack{
                Group{
                
                    Image("friendsTogether")
                        .resizable()
                        .frame(width: w*0.9, height: w*0.45)
                }
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
