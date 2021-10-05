//
//  MatchProtocal.swift
//  Constellation

import UIKit

protocol MatchViewProtocal: class {
    
    func setData(_ data: [Constellation])
    func activityStart()
    func activityStop()
    func setBoyButtonTitle(title: String)
    func setGirlButtonTitle(title: String)
    func alert()
    func showDetail(_ data: Match)
}

protocol MatchPresentProtocal: class {
    
    var view: MatchViewProtocal? { get set }
    var interactor: MatchInteractorInputProtocal? { get set }
    var wireFrame: MatchWireFrameProtocal? { get set }    
    
    func viewDidLoad()
    func selectMan()
    func selectWonmen()
    func selectConstellation(_ select: String)
    func checkConstellation()
    func sendData()
    
}

protocol MatchInteractorInputProtocal: class {
    
    var present: MatchInteractorOutputProtocal? { get set }
    
    func loadData(men: String, women: String)
    func selectData()
}

protocol MatchInteractorOutputProtocal: class {
    func fetchData(_ data: Match)
    func generateData(_ data: [Constellation])
}


protocol MatchWireFrameProtocal: class {
    static func createModule(viewController: MatchViewController)
    func navigationPush(vc: UIViewController)
}
