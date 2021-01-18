//
//  SongEditor.swift
//  HW4-00757005
//
//  Created by User11 on 2021/1/17.
//

import SwiftUI

struct SongEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var songsData: SongsData
    @State private var song = ""
    @State private var singer = ""
    @State private var selectType = ""
    @State private var score : CGFloat = 0
    @State private var favorite = true
    var editSong: Song?
    var type = [ "華語流行", "獨立音樂", "搖滾樂", "K-pop", "EDM", "R&B"]
    
    var body: some View {
            Form {
                TextField("歌名", text: $song)
                TextField("演唱者", text: $singer)
                
                VStack{
                    Picker(selection: $selectType, label: Text("曲風")) {
                        ForEach(self.type, id:\.self) { (type) in
                            Text(type)
                        }
                    }
                }
                
                HStack {
                    Text("喜好分數： \(Int(score))")
                    Slider(value: $score, in: 1...10, step: 1)
                }
                
                Toggle("是否加入至最愛清單？", isOn:  $favorite)
            }
            .navigationBarTitle(editSong == nil ? "新增歌曲" : "編輯歌曲")
            .navigationBarItems(trailing: Button("新增"){
                let song = Song(song: self.song, singer: self.singer, selectType: self.selectType, score: Int(self.score), favorite: self.favorite)
                if let editSong = self.editSong{
                    let index = self.songsData.songs.firstIndex{
                        $0.id == editSong.id
                    }!
                    self.songsData.songs[index] = song
                } else{
                    self.songsData.songs.insert(song, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(song.isEmpty || singer.isEmpty || selectType.isEmpty))
            .onAppear{
                if let editSong = self.editSong, self.song == "" {
                    self.song = editSong.song
                    self.singer = editSong.singer
                    self.selectType = editSong.selectType
                    self.score = CGFloat(editSong.score)
                    self.favorite = editSong.favorite
                }
            }
    }
}

struct SongEditor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SongEditor(songsData: SongsData())
        }
    }
}
