//
//  mainView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

struct mainView: View {
    @ObservedObject var dt: Data = .data
    var body: some View {
        ZStack{
            if self.dt.view == "title"{
                titleView()
            }
            if self.dt.view == "home"{
                homeView()
            }
            if self.dt.view == "log"{
                logView()
            }
            if self.dt.menuBar {
                menuButtonView()
            }
            if self.dt.view == "game1"{
                game1()
            }
        }
    }
    func changeView(view: String){
        self.dt.view = "\(view)"
    }
}

class Data: ObservableObject {
    private init(){ }
    static let data = Data()
    
    @Published var view = "title"
    @Published var menuBar = true
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
