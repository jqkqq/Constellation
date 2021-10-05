//
//  SelectDetailInteractor.swift
//  Constellation

import Foundation

class SelectDetailInteractor: SelectDetailInputInteractorProtocal {

    var present: SelectDetailOutputInteractorProtocal?
    
    func getDate(_ constellation: Constellation, dayType: DayType) {
        loadData(constellation, dayType: dayType)
    }
    
    func loadData(_ constellation: Constellation, dayType: DayType) {
        APIService.shared.getData(constellation, dayType: dayType, completion: {
            self.present?.dataFetch($0)
        })
    }
    
}
