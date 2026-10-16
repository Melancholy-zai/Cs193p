//
//  CodeBreakerView.swift
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

struct CodeBreakerView: View {
    let game = CodeBreaker()
    
    var body: some View {
        VStack {
//            pegs(colors: [.red,.green,.green,.yellow]) //硬编码写法，举个例子而已
//            pegs(colors: game.masterCode.pegs) //写法（1），冒号后面是颜色数组
            view(for: game.masterCode) //写法（2）for是外部参数，不是循环
            view(for: game.guess)
        }
        .padding()
    }

//    func pegs(colors:Array<Color>) -> some View{ //写法（1）
    func view(for code:Code) -> some View{ //写法（2）
        HStack{
//            ForEach(colors.indices,id:\.self){index in//写法（1），遍历颜色数组的下标，并且以每个下标本身作为对应视图的身份编号
            ForEach(code.pegs.indices,id:\.self){index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1,contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
            }
            
            MatchMarkets(matches: [.exact, .nomatch, .inexact,.exact])//这个是传入的数据。第四个元素 .exact 会同时影响matchMarker里的计数（exactCount、foundCount）
        }
    }
}


#Preview {
    CodeBreakerView()
}
