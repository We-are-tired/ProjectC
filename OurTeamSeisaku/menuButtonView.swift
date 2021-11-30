//
//  menuButtonView.swift
//  OurTeamSeisaku
//
//  Created by cmStudent on 2021/11/22.
//

import SwiftUI

struct menuButtonView: View {
    @State var button = false
    var body: some View {
        VStack{
            HStack{
                Spacer().frame(width: 5)
                VStack{
                    if button {
                        Group{
                            Button(action: {button.toggle()}) {
                                Image(systemName: "chevron.down")
                                    .resizable()
                            }
                            Button(action: {
                                mainView().changeView(view: "home")
                            }) {
                                Image(systemName: "house.fill")
                                    .resizable()
                            }
                            Button(action: {}) {
                                Image(systemName: "arrowshape.turn.up.left.fill")
                                    .resizable()
                            }
                            Button(action: {}) {
                                Image(systemName: "pause.fill")
                                    .resizable()
                            }
                        }.frame(width: 15, height:15)
                        .padding(5)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    } else {
                        Button(action: {button.toggle()}) {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 15, height:15)
                                .padding(5)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        }
                            
                        Text(" ")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text(" ")
                            .font(.title)
                        Text(" ")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
            }
        }
    }
}

struct menuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        menuButtonView()
    }
}
