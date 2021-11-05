//
//  Test.swift
//  USBank
//
//  Created by Baiaman Gapparov on 11/5/21.
//

import Foundation

enum Color{
    case red, yellow, white
    case customColor(color: String)
}

class Hello {
    var a: Int = 0
    
    func printName(c: Color) {
        switch c {
        case .customColor(let color):
        print(color)
        default:
            break
        }
    }
    
    func sortArray(helloArray: [Hello]) -> [Hello] {
        var sortedHello = helloArray.sorted { $0.a < $1.a }
        return sortedHello
    }
}

//var clusere = (str: String ->[Void] { [unowned self] in
//
//})


extension Hello {
    var comProp: Int  {
        return a + 1
    }
}
