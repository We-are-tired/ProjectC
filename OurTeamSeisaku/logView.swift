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
                        mainView().changeView(view: "Setting")
                    }
                        .font(.title)
                }
                
                
                Spacer()
                
                ForEach(1..<6){ num in
                    logs(num: num)
                }
                
                Spacer()
                
            }
        }
    }
}

struct logs: View {
    let w = UIScreen.main.bounds.width * 0.95
    let h = UIScreen.main.bounds.height
    let num: Int
    var body: some View {
        HStack{
            Text("\(num)")
            VStack{
                Image("kids1")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("高山 恐男")
            }
            Text("&")
            VStack{
                Image("kids2")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("横上 縦子")
            }
            VStack{
                Text("時間")
                Text("端末")
                Text("AppleCare")
            }
            Text("WIN")
        }.frame(width: w, height: h/8)
        .border(Color.black)
    }
}
    
struct logView_Previews: PreviewProvider {
    static var previews: some View {
        logView()
    }
}
