//
//  AudioManagerViewModel.swift
//  FootieChants
//
//  Created by tobi adegoroye on 23/05/2021.
//

import Foundation
import AVKit

class AudioMangerViewModel {
    
    private var chantAudioPlayer: AVAudioPlayer?
    
    func playback(_ item: League) {
        
        for team in item.teams{
            if team.isPlaying {
                chantAudioPlayer?.stop()
            } else {
     
                guard let path = Bundle.main.path(forResource: "\(team.id.PremierLeagueChantFile).mp3", ofType: nil) else {return}
                let url = URL(fileURLWithPath: path)
                do {
                    chantAudioPlayer = try AVAudioPlayer(contentsOf: url)
                    chantAudioPlayer?.numberOfLoops = -1
                    chantAudioPlayer?.play()
                } catch {
                    print(error)
                }
            }
            
        }

    }
}
