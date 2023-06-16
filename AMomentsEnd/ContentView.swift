import SwiftUI

struct ContentView: View {
    @StateObject private var gameLogic = GameLogic()
    
    
    var body: some View {
        ZStack {
            // タイトル画面 => 仕合い画面
            if !gameLogic.onGame {
                TitleView().environmentObject(gameLogic)
            } else if !gameLogic.gameOver{
                OnGameView().environmentObject(gameLogic)
            } else {
                GameOverView().environmentObject(gameLogic)
            }
        }
        .background(Color.black)
    }
    //横向き固定
    var preferredInterfaceOrientation: UIInterfaceOrientation {
        return .landscapeLeft
    }
}


//プレビュー表示
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}
