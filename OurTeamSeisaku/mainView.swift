//
//  mainView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

struct mainView: View {
    @ObservedObject var data: Data = .data
    var body: some View {
        ZStack{
            if self.data.view == "title"{
                titleView()
            }
            if self.data.view == "home"{
                homeView()
            }
            if self.data.view == "log"{
                logView()
            }
            if self.data.menuBar {
                menuButtonView()
            }
            if self.data.view == "Setting"{
                GameSetting()
            }
            if self.data.view == "Newton"{
                Newton()
            }
        }
    }
    
    func changeView(view: String){
        self.data.view = "\(view)"
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
