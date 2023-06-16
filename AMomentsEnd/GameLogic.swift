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
    @Published var stage = 0
    func frameFix(num:Double) -> Double{
        return num * 0.03
    }
    
    func StartGame(){
        timer?.invalidate()
        attacked = false
        attackCountTimer=0
        startCountTimer=0
        stage+=1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.result=false
        }
        
        self.onGame = true
        randomNumber = Double.random(in : 1 ... 7 )
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
    func AttackValue(){
        print("attacked")
 
        result = false
        attacked = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.gameOver = true
        }
        timer?.invalidate()
    }
    func AttackTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval :0.01 , repeats :true) {
            [weak self] _ in
            guard let self = self else {return}
            self.attackCountTimer += 0.01
            self.attackCountTimer = (self.attackCountTimer * 100 ).rounded() / 100
            switch stage{
            case 1 : if attackCountTimer>frameFix(num: 100){
                AttackValue()
            }
            case 2 : if attackCountTimer>frameFix(num: 63){
                AttackValue()
            }
            case 3 : if attackCountTimer>frameFix(num: 41){
                AttackValue()
            }
            case 4 : if attackCountTimer>frameFix(num: 13){
                AttackValue()
            }
            case 5 : if attackCountTimer>frameFix(num: 10){
                AttackValue()
            }
            default : self.gameOver=false
            }
        }
        
    }
    
    func Attack(){
        attacked = true
        print(attacked)
        timer?.invalidate()
        if startCountTimer < randomNumber {
            result = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.gameOver = true
            }
            
        }else{
            result = true
        }
        randomNumber = 0
        attackCountTimer = 0
        startCountTimer = 0
    }
    
    func ReStart(){
        stage = 0
        randomNumber = 0
        attackCountTimer = 0
        startCountTimer = 0
        gameOver = false
        StartGame()
    }
    func GoTitle(){
        stage = 0
        randomNumber = 0
        attackCountTimer = 0
        startCountTimer = 0
        gameOver = false
        onGame = false
        gameOver = false
    }
    
    
    
}
