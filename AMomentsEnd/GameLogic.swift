//
//  GameLogic.swift
//  AMomentsEnd
//
//  Created by user on 2023/06/13.
//

import SwiftUI
import Combine

/**
 *ゲーム操作に関わるクラス
 */
class GameLogic: ObservableObject {
    //判定関連
    @Published var onGame = false
    @Published var attacked = false
    @Published var result = false
    @Published var gameOver = false
    
    // Timer 関連
    @Published var startCountTimer :Double = 0
    @Published var attackCountTimer : Double = 0
    @Published var randomNumber : Double = 0
    @Published var timer : Timer?
    
    //stage関係
    @Published var stage = 1
    
    func StartGame(){
        timer?.invalidate()
        attackCountTimer=0
        startCountTimer=0
        onGame = true
        print(onGame)
        randomNumber = Double.random(in : 0.00 ... 5 )
        print(randomNumber)
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {
            [weak self] _ in
            guard let self = self else { return }
            self.startCountTimer += 0.01
            self.startCountTimer = (self.startCountTimer * 100).rounded() / 100
            if randomNumber<self.startCountTimer {
                AttackTimer()
            }
        }
                   
    }
    
    func AttackTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval :0.01 , repeats :true) {
            [weak self] _ in
            guard let self = self else {return}
            self.attackCountTimer += 0.01
            self.attackCountTimer = (self.attackCountTimer * 100 ).rounded() / 100
        }
        
    }
    
    
    func Attack(){
        attacked = !attacked
        print(attacked)
        timer?.invalidate()
        if startCountTimer < randomNumber {
            result = false
            gameOver = true
            print(result)
        }else{
            result = true
            stage+=1
            print(result)
        }
    }
    
    
    func ReStart(){
        stage = 1
        randomNumber = 0
        attackCountTimer = 0
        startCountTimer = 0
        gameOver = false
    }
    func GoTitle(){
   ReStart()
        onGame = !onGame
        gameOver = false
    }
    
    
    
}
