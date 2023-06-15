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
                Button(action : { gameLogic.StartGame()
                    isButtonTapped = true
                }
                ) {
                    Text("仕合い開始！").font(.custom("g_brushtappitsu_free_bold",size:60))
                        .foregroundColor(.black)
                        .blinkEffect(opacity:0.3...1 , interval:isButtonTapped ? 0.1 : 1 )
                }
            }.offset(y:100)
        }.opacity(isButtonTapped ? 0 : 1)
        .animation(.easeOut(duration: 1.5),value:isButtonTapped)
        
    }
    
}
