//
//  LaLigaTeam.swift
//  ClubsCollectionView
//
//  Created by tobi adegoroye on 29/05/2021.
//

import Foundation

import UIKit

class LaLigaLeaugeTeam {

    let id: LaLigaTeamType
    let name: String
    let manager: LaLigaManager
    let info: String
    let founded: String
    var isPlaying: Bool
    
    internal init(id: LaLigaTeamType, name: String, manager: LaLigaManager, info: String, founded: String, isPlaying: Bool = false) {
        self.id = id
        self.name = name
        self.manager = manager
        self.info = info
        self.founded = founded
        self.isPlaying = isPlaying
    }
    
    
}
 
