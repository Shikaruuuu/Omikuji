//
//  ContentView.swift
//  Omikuji
//
//  Created by 横森暉 on 2021/09/11.
//

import SwiftUI

struct ContentView: View {
    let omikujis = ["daikiti", "chukiti", "syoukiti", "kyo"]
    @State private var kuji = "empty"
    @State private var isShow = false
    var body: some View {
        VStack{
            Text("おみくじ")
                .font(.largeTitle)
            Image(kuji)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 400)
                .scaleEffect(isShow ? 1 : 0)
                .rotationEffect(isShow ? .degrees(360) : .zero)
                .animation(.easeInOut(duration: 1))
            Spacer()
            HStack{
                Spacer()
                //占うボタン
                Button(action: {
                    if !self.isShow {
                        self.isShow = true
                        self.kuji = self.omikujis.randomElement()!
                    }
                }){
                    Text("占う")
                        .font(.largeTitle)
                        .background(Capsule()
                                        .foregroundColor(isShow ? .gray : .yellow)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
                    )
                }
                .disabled(isShow ? true : false)
                Spacer()
                //消去ボタン
                Button(action: {
                    self.isShow = false
                }){
                    Text("消去")
                        .font(.largeTitle)
                        .background(Capsule()
                                        .foregroundColor(!isShow ? .gray : .yellow)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40)
                        )
                }
                .disabled(!isShow ? true : false)
                Spacer()
        }
    }
        .padding()
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

