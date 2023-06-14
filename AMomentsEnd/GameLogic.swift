//
//  GameLogic.swift
//  AMomentsEnd
//
//  Created by user on 2023/06/13.
//


import SwiftUI
import Combine

class GameLogic: ObservableObject {
    @Published var onGame = false
    
    func StartGame(){
        onGame = true
    }
}
