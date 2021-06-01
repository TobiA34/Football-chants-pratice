//
//  Club.swift
//  ClubsCollectionView
//
//  Created by tobi adegoroye on 25/05/2021.
//

import UIKit

struct League {
    let name: String?
    let image: UIImage?
    let colour: UIColor?
    let teams: [PremierLeaugeTeam]
}

 

struct Image {
    static let SerieAImg = UIImage(named:"Serie-A")
    static let PremierLeagueImg = UIImage(named:"Premier-leauge")
    static let Ligue1Img = UIImage(named:"Ligue1")
    static let LaLigaImg = UIImage(named:"LaLiga")

}

