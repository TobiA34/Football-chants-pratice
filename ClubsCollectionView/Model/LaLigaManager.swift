//
//  LaLigaManager.swift
//  ClubsCollectionView
//
//  Created by tobi adegoroye on 29/05/2021.
//

import Foundation

class LaLigaManager {
    
    let name: String
    let job: JobType
 
    let managerID: LaLigaManagerType
    
    internal init(name: String, job: JobType, managerID: LaLigaManagerType) {
        self.name = name
        self.job = job
        self.managerID = managerID
    }
    
 }
