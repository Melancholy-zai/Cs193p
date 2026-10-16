//
//  CodeBreaker.swift
//  cs193p
//
//  Created by 潘泓妤 on 2026/10/12.
//

import Foundation //提供与界面无关的基础工具Date、URL
import SwiftUI //给开发者使用的界面框架入口使用 Color、Text、Button 等

typealias Peg = Color //本来想创建struct，但是发现只有Color这一个属性（也没有别的函数），所以起个别名

struct CodeBreaker{
    var masterCode: Code = Code(kind:.master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = [Code]() //左右两边可以省略一个[Code]
    var pegChoices: [Peg] = [.red, .green, .blue, .yellow]
}

struct Code{
    var kind: Kind
    var pegs: [Peg] = [.green, .red, .red, .yellow]
    
    enum Kind{
        case master
        case guess
        case attempt
        case unknown
    }
}
