//
//  ContentView.swift
//  cs193p
//
//  Created by 潘泓妤 on 2026/10/8.
//

import SwiftUI

enum Match{
    case nomatch
    case exact
    case inexact
}

struct ContentView: View {
    var body: some View {
        VStack {
            pegs(colors: [.red,.green,.green,.yellow])
            pegs(colors: [.red,.green,.red,.yellow])
            pegs(colors: [.red,.green,.blue,.green])
        }
        .padding()
    }
    
    func pegs(colors:Array<Color>) -> some View{
        HStack{
            ForEach(colors.indices,id:\.self){index in//遍历颜色数组的下标，并且以每个下标本身作为对应视图的身份编号。
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1,contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            
            MatchMarkets(matches: [.exact, .nomatch, .inexact,.exact])//这个是传入的数据。第四个元素 .exact 会同时影响matchMarker里的计数（exactCount、foundCount）
        }
    }
}


#Preview {
    ContentView()
}
