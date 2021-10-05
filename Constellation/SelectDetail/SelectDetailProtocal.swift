//
//  SelectDetailProtocal.swift
//  Constellation

import Foundation

protocol SelectDetailViewProtocal: class {
    func showChartData(_ horoscope: Horoscope)
    func activityStart()
    func activityStop()
}

protocol SelectDetailPresentProtocal: class {
    var view: SelectDetailViewController? { get set }
    var wireFrame: SelectDetailWireFrame? { get set }
    var interactor: SelectDetailInputInteractorProtocal? { get set }
    var constellation: MyConstellation? { get set }
    
    func viewDidLoad()
    func selectDayType(_ select: DayType)
}

protocol SelectDetailInputInteractorProtocal: class {
    var present: SelectDetailOutputInteractorProtocal? { get set }
    
    func getDate(_ constellation: Constellation, dayType: DayType)
}

protocol SelectDetailOutputInteractorProtocal: class {
    func dataFetch(_ horoscope: Horoscope)
}

protocol SelectDetailWireFrameProtocal: class {
    static func creatDetailModule(_ constellation: MyConstellation ,viewController: SelectDetailViewController)
}
