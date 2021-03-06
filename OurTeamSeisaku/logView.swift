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
            Image("Setting_pic")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.3)
                .saturation(0.3)
            //            ボタンなど
            VStack{
                Spacer().frame(height: 10)
                HStack{
                    Spacer()
                    Text("戻る")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .onTapGesture {mainView().changeView(view: "Setting")}
                }
                Text("あそんだ記録")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.orange)
                
                Spacer()
                
                logs(num: 0)
                logs(num: 1)
                logs(num: 2)
                logs(num: 3)
                logs(num: 4)
                
                Spacer()
                
            }
        }
    }
}

struct logs: View {
    let w = UIScreen.main.bounds.width * 0.95
    let h = UIScreen.main.bounds.height
    let num: Int
    @State var allLog:[[String]] = []
    @State var log:[String] = ["","","","","","","","",""]
    var body: some View {
        HStack{
            if num <= allLog.count{
                VStack{
                    Image("kids\(log[0])")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text(log[1])
                        .font(.caption2)
                }
                Text("&")
                VStack{
                    Image("kids\(log[2])")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text(log[3])
                        .font(.caption2)
                }
                VStack{
                    Text("時間：\(log[4])秒")
                    Text("端末：\(log[5])")
                    Text("速度：\(log[6])")
                    Text("AppleCare：\(log[7])")
                    
                }
                Image(systemName:log[8])
                    .resizable()
                    .frame(width: 20, height: 20)
            } else {
                Text("\(num)回前のきろくはないよ！\nもっとお友達と遊ぼうね！")
                    .font(.title)
            }
        }.frame(width: w, height: h/8)
            .border(Color.black)
            .background(Color.white)
            .onAppear(){
                allLog = logManager().getLog()
                if num+1 <= allLog.count{
                    log = allLog[num]
                }
            }
    }
}

struct logView_Previews: PreviewProvider {
    static var previews: some View {
        logView()
    }
}

class logManager:ObservableObject {
    @Published var allLog:[[String]] = []
    
    @State var log = []
    
    func getSavedLog() {
        // 保存済みlog配列(savedLog)の取得
        if let savedLog = UserDefaults.standard.array(forKey: "NewtonLog") as? [[String]]{
            allLog = savedLog
        }
    }
    
    func addlog(newLog: [String]) {
        // 保存済みlog配列(savedLog)の取得
        getSavedLog()
        
        // ５つ目の除外、内容を右にずらす
        // [0,1,2,3,4] -> [0,0,1,2,3] -> [new,0,1,2,3]
        print(allLog.count)
        
        if allLog.count == 5{
            // 全部揃っている時
            for i in 1...4{
                allLog[5-i] = allLog[4-i]
            }
            allLog[0] = newLog
        }else{
            // 0~4個しかない時は5個になるまで0に追加,並べ替え
            allLog.insert(newLog, at: 0)
        }
        
        // 変更したallLogをsavedlogとして保存
        UserDefaults.standard.setValue(allLog, forKey: "NewtonLog")
        print(allLog)
    }
    
    func getLog() -> [[String]]{
        // 1~5回分の記録の入った配列の取得。
        // 保存済みlog配列(savedLog)の取得
        getSavedLog()
        // allLog配列の受け渡し
        return allLog
    }
}
