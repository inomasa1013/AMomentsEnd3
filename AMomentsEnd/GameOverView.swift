//
//  GameOverView.swift
//  AMomentsEnd
//
//  Created by user on 2023/06/14.
//

import SwiftUI
import Kingfisher

struct GameOverView : View {
    @EnvironmentObject private var gameLogic : GameLogic
    
    var body :some View{
        ZStack{
            KFImage(URL(string:"https://tshop.r10s.jp/auc-toysanta/cabinet/030gam140/g-4qoh000vqk-003.jpg?fitin=720%3A720"))
            HStack{
                Button(action : { gameLogic.ReStart()}){
                    Text("しきりなおし！").font(.custom("FuwamokoFont",size:40))
                        .foregroundColor(.purple)
                        .background(Color.yellow.opacity(0.7))
                        .cornerRadius(20)
                }
                Button(action:{gameLogic.GoTitle()}){
                    Text("ばたんきゅ〜！").font(.custom("FuwamokoFont",size:40))
                        .foregroundColor(.purple)
                        .background(Color.yellow.opacity(0.7))
                        .cornerRadius(20)
                }
            }
        }
    }
}
