//
//  최소직사각형.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/09/30.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var widthArr = sizes.map { $0.first! }
    var heightArr = sizes.map { $0.last! }

    for (idx, (width, height)) in zip(widthArr, heightArr).enumerated() where width > height {
        swap(&widthArr[idx], &heightArr[idx])
    }

    return widthArr.max()! * heightArr.max()!
}
