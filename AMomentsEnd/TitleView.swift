//
//  TitleView.swift
//  AMomentsEnd
//
//  Created by user on 2023/06/13.
//

import SwiftUI
import Kingfisher

struct TitleView : View{
    @EnvironmentObject private var gameLogic: GameLogic
    @State private var isButtonTapped = false
    @State private var animationStarted = false
    
    let customColor = Color(red: 211/255, green: 147/255, blue: 255/255)
    
    
    var body : some View{
        
        ZStack{
            customColor
            Image("20190707100851")
                .resizable()
                .frame(width:400,height:180)
                .aspectRatio(contentMode: .fit)
                .offset(y:-50)
            VStack{
                Button(action : {
                    isButtonTapped = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        animationStarted = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                      animationStarted = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                        gameLogic.StartGame()
                    }
                }
                ) {
                    Text("仕合い開始！").font(.custom("g_brushtappitsu_free_bold",size:60))
                        .foregroundColor(.black)
                        .blinkEffect(opacity:0.3...1 , interval:isButtonTapped ? 0.1 : 1 )
                }
            }.offset(y:100)
        }.opacity(isButtonTapped ? 0 : 1)
            .animation(.easeOut(duration: 1.5),value:isButtonTapped)
        
        ZStack{customColor
            
            Image("explain")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack{Text("が表示されたら").font(.custom("g_brushtappitsu_free_bold",size:45))
                    .foregroundColor(.black)
                
                Text("   画面をタップ！！").font(.custom("g_brushtappitsu_free_bold",size:45))
                    .foregroundColor(.black)
            }.offset(x:50,y:120)
                .lineLimit(1)
        }           .opacity(animationStarted ? 1 : 0)
            .animation(.easeIn(duration: 1.5),value:animationStarted)
    }
    
}
