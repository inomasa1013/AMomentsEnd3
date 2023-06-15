//
//  OnGameView.swift
//  AMomentsEnd
//
//  Created by user on 2023/06/13.
//

import SwiftUI
import Kingfisher


struct OnGameView : View{
    @EnvironmentObject private var gameLogic: GameLogic
    let customColor = Color(red: 255/255, green: 0/255, blue: 128/255)
    
    @ViewBuilder
    var body : some View{
        ZStack{Image("平原-夕")
            switch gameLogic.stage {
            case 1:  ZStack{Image("Image")
                    .resizable()
                    .frame(width:170,height:150)
                    .aspectRatio(contentMode: .fill)
                    .onTapGesture {
                        gameLogic.Attack()
                    }
                    .offset(x:-190,y:120)
                if gameLogic.startCountTimer>gameLogic.randomNumber {
                    VStack{Text("imadesu")
                        Text(String(gameLogic.attackCountTimer))
                            .font(.custom("g_brushtappitsu_free_bold",size:40))
                            .foregroundColor(.black)
                    }
                    
                }
            }
            case 2: ZStack{KFImage(URL(string: "https://pbs.twimg.com/media/D4BRnydUUAEdqt6.jpg:large")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        gameLogic.Attack()
                    }
                if gameLogic.startCountTimer>gameLogic.randomNumber {
                    VStack{ Text("imadesu")
                        Text(String(gameLogic.attackCountTimer))
                    }
                    
                }
            }
            default :
                ZStack{
                    VStack{
                        Text("完全勝利")
                            .font(.custom("g_brushtappitsu_free_bold",size:40))
                            .offset(y:150)
                        Spacer(minLength: 10)
                        HStack{
                       
                            Button(action : { gameLogic.ReStart()}){
                                Text("もっとあそぶ！").font(.custom("FuwamokoFont",size:40))
                                    .foregroundColor(.purple)
                                    .background(Color.yellow.opacity(0.7))
                                    .cornerRadius(20)
                            }
                            Button(action:{gameLogic.GoTitle()}){
                                Text("ばいばい！").font(.custom("FuwamokoFont",size:40))
                                    .foregroundColor(.purple)
                                    .background(Color.yellow.opacity(0.7))
                                    .cornerRadius(20)
                            }
                        }
                    }
                }

            }
     
            
        }.onChange(of:gameLogic.stage){change in
                gameLogic.StartGame()
            }
    }
    
}
