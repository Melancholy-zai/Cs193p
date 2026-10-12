//
//  MatchMarkets.swift
//  cs193p
//
//  Created by 潘泓妤 on 2026/10/9.
//

import SwiftUI

struct MatchMarkets: View {
    var matches:[Match]
    var body: some View {
        HStack{
            VStack{
//                Circle().fill(Color.green)
//                Circle().strokeBorder(Color.primary,lineWidth: 3)//strokeBorder 描边并保持在内部，但会变成视图，圆形的1:1宽高比就丢了
//                    .aspectRatio(1,contentMode: .fit)
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            VStack{
//                Circle()
//                Circle().opacity(0.5)//透明度
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
        }
    }
    
    func matchMarker(peg: Int) -> some View{
        //.count(where) 函数会把数组里的元素按顺序，一个一个传给闭包。
        
//        let exactCount: Int = matches.count(where:{match in match == .exact}) //函数式编程
        let exactCount = matches.count{ $0 == .exact } //从上面那行写法优化而来
        let foundCount = matches.count{ $0 != .nomatch}
        
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear,lineWidth: 2)
            .aspectRatio(1,contentMode: .fit)
    }
}
