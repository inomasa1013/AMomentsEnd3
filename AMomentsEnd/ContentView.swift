import SwiftUI


struct ContentView: View{
    @StateObject private var gameLogic = GameLogic()
    var body : some View{
        ZStack{
//タイトル画面 => 仕合い画面
            if !gameLogic.onGame {TitleView().environmentObject(gameLogic)
            }else{
                OnGameView().environmentObject(gameLogic)
            }
//ゲームオーバー画面
            if gameLogic.gameOver
            {GameOverView().environmentObject(gameLogic)}
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}
