//
//  GameScreen.swift
//  BurgerKingApp
//
//  Created by cmStudent on 2025/06/12.
//

import SwiftUI

struct GameScreen: View {
    let bgColor = Color.backGroundColor()
    @StateObject var vm: GameViewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            
            VStack {
                // MARK: - HEADER
                HStack(alignment: .center) {
                    //ランキング表示
                    Image(systemName: "medal.star.fill")
                        .foregroundColor(.white)
                        .opacity(0.7)
                        .font(.title)
                    Spacer()
                    //ゲーム時間表示
                    Text("ゲーム時間")
                        .foregroundColor(.white)
                    Spacer()
                    //BGM選択
                    Image(systemName: "music.note.list")
                        .foregroundColor(.white)
                        .opacity(0.7)
                        .font(.title)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - BODY
                VStack {
                    
                    Image("ManDefault")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                }
                
                // MARK: - FOOTER
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 25)
                        .opacity(0.2)
                        .cornerRadius(16)
                    Image("Burger")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
            }
            .overlay(alignment: .center) {
                if !vm.isGameStart {
                    VStack {
                        MenuButtonStyle(title: "ゲーム開始") {
                            vm.isGameStart = true
                            print(vm.isGameStart)
                        }
                        MenuButtonStyle(title: "アイテム一覧") {
                            
                        }
                    }
                }
            }
        }
    }
}

extension Color {
    static func backGroundColor() -> Color {
        return Color.black
    }
}

extension View {
    func MenuButtonStyle(title: String,
                         onTap: @escaping (() -> Void)
    ) -> some View {
        Text(title)
            .frame(minWidth: 100)
            .foregroundColor(.white)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.white, lineWidth: 1)
            )
            .onTapGesture {
                onTap()
            }
    }
}

#Preview {
    GameScreen()
}
