//
//  SelectDetailPresent.swift
//  Constellation

import UIKit

class SelectDetailPresent: SelectDetailPresentProtocal {
    
    weak var view: SelectDetailViewController?
    var wireFrame: SelectDetailWireFrame?
    var interactor: SelectDetailInputInteractorProtocal?
    var constellation: MyConstellation?
    
    func viewDidLoad() {
        startShow()
    }
    
    func startShow() {
        view?.title = constellation?.title.rawValue
        view?.constellationImage.image = UIImage(named: constellation?.image ?? "")
        interactor?.getDate(constellation!.title, dayType: .today)
    }
    
    func selectDayType(_ select: DayType) {        
        view?.activityStart()
        interactor?.getDate(constellation!.title, dayType: select)
    }
    
}

extension SelectDetailPresent: SelectDetailOutputInteractorProtocal {
    
    func dataFetch(_ horoscope: Horoscope) {        
        view?.activityStop()
        view?.showChartData(horoscope)
        print(horoscope)
    }

}
