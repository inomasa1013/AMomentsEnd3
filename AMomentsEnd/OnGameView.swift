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
    
    
    @ViewBuilder
    var body : some View{
        ZStack{
            switch gameLogic.stage {
            case 1:  ZStack{KFImage(URL(string: "https://www.nintendo.co.jp/n08/kirby/sgame/mikiri/g01.gif")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        gameLogic.Attack()
                    }
                if gameLogic.startCountTimer>gameLogic.randomNumber {
                    VStack{Text("imadesu")
                        Text(String(gameLogic.attackCountTimer))
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
                    Text("完全勝利")
                    HStack{
                        Button(action : { gameLogic.ReStart()}){
                            Text("もう一度遊ぶ！")
                        }
                        Button(action:{gameLogic.GoTitle()}){
                            Text("ばいばい！")
                        }
                    }
                    
                }

            }
     
            
        }.onChange(of:gameLogic.stage){change in
                gameLogic.StartGame()
            }
    }
    
}
