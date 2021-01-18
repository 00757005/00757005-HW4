//
//  SongData.swift
//  HW4-00757005
//
//  Created by User11 on 2021/1/17.
//

import Foundation
import Combine

class SongsData: ObservableObject{
    var cancellable: AnyCancellable?
    @Published var songs = [Song]()
    
    init(){
        if let data = UserDefaults.standard.data(forKey: "songs"){
          let decoder = JSONDecoder()
          if let decodedData = try? decoder.decode([Song].self, from: data){
            songs = decodedData
          }
        }
        cancellable = $songs
            .sink(receiveValue: { (value) in
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(value) {
              UserDefaults.standard.set(data, forKey: "songs")
             }
            })
    }
}
