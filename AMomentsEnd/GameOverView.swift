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
            Image("平原-夕")
         
            
            Image("result")
                .resizable()
                .frame(width:170,height:150)
                .aspectRatio(contentMode:.fill)
                .offset(x:-20,y:50)
            
            Text(String(gameLogic.result ? gameLogic.stage:gameLogic.stage-1)+"人ぬき！")
                .font(.custom("g_brushtappitsu_free_bold",size:60))
                .foregroundColor(.black)
                .offset(y:-90)
            HStack{
                Button(action : { gameLogic.ReStart()}){
                    Text("しきりなおし").font(.custom("FuwamokoFont",size:35))
                        .foregroundColor(.purple)
                        .background(Color.yellow.opacity(0.8))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                }
                Button(action:{gameLogic.GoTitle()}){
                    Text("ばたんきゅう").font(.custom("FuwamokoFont",size:35))
                        .foregroundColor(.purple)
                        .background(Color.yellow.opacity(0.8))
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                }
            }
            .offset(y:180)
        }
    }
}
