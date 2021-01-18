//
//  Song.swift
//  HW4-00757005
//
//  Created by User11 on 2021/1/17.
//

import Foundation

struct Song: Identifiable, Codable {
    let id = UUID()
    var song: String
    var singer: String
    var selectType: String
    var score: Int
    var favorite: Bool
}
