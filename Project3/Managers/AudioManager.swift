//
//  AudioManager.swift
//  Project3
//
//  Created by Seana Marie Lanias on 12/11/22.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject{
//    static let shared = AudioManager()
    var player: AVAudioPlayer?
    
    
    func startPlayer(track: String) {
        let url = Bundle.main.url(forResource: track, withExtension: "mp3")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        } catch {
            print ("failure to create player")
        }
    }
    
    func playPause () {
        guard let player = player else {
            print ("instance of player not found")
            return
        }
        
        if player.isPlaying {
            player.pause()
        }
        else {
            player.play()
        }
    }
}
