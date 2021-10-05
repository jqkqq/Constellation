//
//  MatchPresent.swift
//  Constellation


import Foundation

class MatchPresent: MatchPresentProtocal {
    
    var isMan: Bool = true
    var men = ""
    var women = ""
    
    weak var view: MatchViewProtocal?
    var interactor: MatchInteractorInputProtocal?
    var wireFrame: MatchWireFrameProtocal?
    
    func viewDidLoad() {
        interactor?.selectData()
    }
    
    func selectMan() {
        isMan = true
    }
    
    func selectWonmen() {
        isMan = false
    }
    
    func sendData() {
        if men != "" && women != "" {
            view?.activityStart()
            interactor?.loadData(men: men, women: women)
        } else {
            view?.alert()
        }        
    }
    
    func selectConstellation(_ select: String) {
        if isMan {
            men = select
        } else {
            women = select
        }
    }
    
    func checkConstellation() {
        if isMan {
            let select = men == "" ? Constellation.双子座.changeTwoWord(): men
            men = Constellation.双子座.changeTwoWord()
            view?.setBoyButtonTitle(title: select)
        } else {
            let select = women == "" ? Constellation.双子座.changeTwoWord(): women
            women = Constellation.双子座.changeTwoWord()
            view?.setGirlButtonTitle(title: select)
        }        
    }

    
}

extension MatchPresent: MatchInteractorOutputProtocal {
    
    func generateData(_ data: [Constellation]) {
        view?.setData(data)
    }
    
    func fetchData(_ data: Match) {
        view?.activityStop()
        view?.showDetail(data)
    }
    
}
