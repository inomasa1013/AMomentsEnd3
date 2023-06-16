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
    @State private var enemy : String = "wado"
    @State private var kirby : String = "kirby"
    @State private var firstText : Bool = false
    @State private var flying :Bool = false
    @State private var oneBrink :Bool = false
    @State private var twoBrink :Bool = false
    
    let customColor = Color(red: 255/255, green: 0/255, blue: 128/255)

    
    @ViewBuilder
    var body : some View{
        ZStack{Image("平原-夕")
                .resizable()
                .aspectRatio(contentMode: .fill)
            //カービィイメージ
            Image(kirby)
                .resizable()
                .frame(width:170,height:150)
                .aspectRatio(contentMode: .fill)
                .offset(x:gameLogic.result ? 80: !gameLogic.attacked ? -190:-300,
                        y:gameLogic.result ? 100: !gameLogic.attacked ? 140:-150)
                .animation(.linear(duration:gameLogic.result ? 0.1:1.0),value:gameLogic.attacked)
            
            
            //敵イメージ
            Image(enemy)
                .resizable()
                .frame(width:170,height:170)
                .aspectRatio(contentMode: .fill)
                .offset(x:gameLogic.result ? 280:!gameLogic.attacked ? 190:-100,
                        y:gameLogic.result ? -130:!gameLogic.attacked ? 80:120)
                .animation(.linear(duration:!gameLogic.result ? 0.1:1.0),value:gameLogic.attacked)
            //お手つき
            if flying {
                Text("お手つき！")
                    .font(.custom("g_brushtappitsu_free_bold",size:40))
                    .foregroundColor(.black)
            }
            //仕合開始
            if firstText {
                Text(String(gameLogic.stage)+"試合目")
                    .font(.custom("g_brushtappitsu_free_bold",size:55))
                    .foregroundColor(.black)
                
            }
            
            //見切りの瞬間
            if gameLogic.startCountTimer>gameLogic.randomNumber {
                
                if !gameLogic.attacked {VStack{Image("moments")
                        .resizable()
                        .frame(width:250,height:250)
                        .aspectRatio(contentMode: .fill)
                    Text(String(gameLogic.attackCountTimer))
                        .font(.custom("g_brushtappitsu_free_bold",size:50))
                        .foregroundColor(.black)
                }
                }
            }
            
            if oneBrink{
                Image("1cut")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            if twoBrink{
                Image("2cut")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            //                ZStack{
            //                    VStack{
            //                        Text("完全勝利")
            //                            .font(.custom("g_brushtappitsu_free_bold",size:40))
            //                            .offset(y:150)
            //                        Spacer(minLength: 10)
            //                        HStack{
            //
            //                            Button(action : { gameLogic.ReStart()}){
            //                                Text("もっとあそぶ！").font(.custom("FuwamokoFont",size:40))
            //                                    .foregroundColor(.purple)
            //                                    .background(Color.yellow.opacity(0.7))
            //                                    .cornerRadius(20)
            //                            }
            //                            Button(action:{gameLogic.GoTitle()}){
            //                                Text("ばいばい！").font(.custom("FuwamokoFont",size:40))
            //                                    .foregroundColor(.purple)
            //                                    .background(Color.yellow.opacity(0.7))
            //                                    .cornerRadius(20)
            //                            }
            //                        }
            //                    }
            //                }
        }.onChange(of:gameLogic.stage){newValue in
            enemy = getEnemyName(for: newValue)
            firstText = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               firstText = false
            }
        }.onChange(of:gameLogic.attacked){result in
            //カットイン
            if gameLogic.attacked {
                oneBrink = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.075) {
                    oneBrink = false
                    twoBrink = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    twoBrink = false
                }
            }
            if !gameLogic.result{
                enemy+="Win"
                kirby+="Lose"
            }else if gameLogic.attacked{  DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                gameLogic.StartGame()
                kirby="kirby"
            }
            }
        }
        .onTapGesture {
            if !gameLogic.attacked{
                gameLogic.Attack()
                if gameLogic.result {
                    enemy+="Lose"
                    kirby+="Win"
                }else{flying = true}
          
            }
     
        }.onAppear {
            kirby="kirby"
            firstText = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               firstText = false
            }
        }
    }
    
    private func getEnemyName(for stage: Int) -> String {
        switch stage {
        case 1: return "wado"
        case 2: return "willy"
        case 3: return "kawasaki"
        case 4: return "dedede"
        case 5: return "meta"
        default: return ""
        }
    }
}
