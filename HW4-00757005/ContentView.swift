//
//  ContentView.swift
//  HW4-00757005
//
//  Created by User11 on 2021/1/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var songData = SongsData()
    var body: some View {
        VStack {
            TabView {
                SongList(songsData: self.songData)
                    .tabItem {
                        Text("收錄曲目")
                        Image(systemName: "music.quarternote.3")
                    }
                ChartView(songData: self.songData)
                    .tabItem{
                        Text("圖表分析")
                        Image(systemName: "chart.pie.fill")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
