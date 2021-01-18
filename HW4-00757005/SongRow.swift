//
//  SongRow.swift
//  HW4-00757005
//
//  Created by User11 on 2021/1/17.
//

import SwiftUI

struct SongRow: View {
    var song1: Song
    var body: some View {
        VStack{
            HStack {
                Text(" \(song1.song) / \(song1.singer)")
                Spacer()
                Group{
                    Text("喜好分數：\(song1.score)")
                    Image(systemName: song1.favorite ? "heart.fill": "heart")
                        .foregroundColor(.red)
                }.offset(x: 0, y: 10)
            }
            HStack{
                Text(" \(song1.selectType)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.orange)
                Spacer()
            }
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song1: Song(song: "大海", singer: "南西肯恩", selectType: "華語流行", score: 10, favorite: true)).previewLayout(.sizeThatFits)
    }
}
