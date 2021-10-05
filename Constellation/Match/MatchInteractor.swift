//
//  MatchInteractor.swift
//  Constellation

import Foundation

class MatchInteractor: MatchInteractorInputProtocal {

    var present: MatchInteractorOutputProtocal?
    
    func loadData(men: String, women: String) {
        APIService.shared.getMatchData(men: men, women: women, completion: {
            self.present?.fetchData($0)
        })
    }
    
    func selectData() {
        present?.generateData(generateData())
    }
    
    func generateData() -> [Constellation] {
        return
            [Constellation.双子座,
             Constellation.双鱼座,
             Constellation.处女座,
             Constellation.天秤座,
             Constellation.天蝎座,
             Constellation.射手座,
             Constellation.巨蟹座,
             Constellation.摩羯座,
             Constellation.水瓶座,
             Constellation.狮子座,
             Constellation.白羊座,
             Constellation.金牛座]
    }
    
}
