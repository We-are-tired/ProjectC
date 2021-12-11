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
            Image("broken_iphone")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Group{
                
                    Image("friendsTogether")
                        .resizable()
                        .frame(width: w*0.9, height: w*0.45)
                }
                Spacer().frame(height: 100)
                
                Button("はい。"){
                    mainView().changeView(view: "Setting")
                }
                .padding()
                .font(.title)
                .background(Color.red)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .cornerRadius(24)
            }
        }
    }
}

struct titleView_Previews: PreviewProvider {
    static var previews: some View {
        titleView()
    }
}
