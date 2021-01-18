//
//  SongList.swift
//  HW4-00757005
//
//  Created by User11 on 2021/1/17.
//

import SwiftUI

struct SongList: View {
    @ObservedObject var songsData = SongsData()
    @State private var show = false
    var body: some View {
        NavigationView {
            List {
                ForEach(songsData.songs){ (song) in
                    NavigationLink(destination: SongEditor(songsData:  self.songsData, editSong: song)) {
                        SongRow(song1: song)
                    }
                }
                .onMove { (indexSet, index) in
                    self.songsData.songs.move(fromOffsets: indexSet, toOffset: index)
                }
                .onDelete{ (index) in
                    self.songsData.songs.remove(atOffsets: index)
                }
            }
            .navigationBarTitle("收錄曲目")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    self.show = true
                },label: {
                    Image(systemName: "plus")
                    }))
                .sheet(isPresented: $show){
                    NavigationView {
                        SongEditor(songsData: self.songsData)
                    }
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
