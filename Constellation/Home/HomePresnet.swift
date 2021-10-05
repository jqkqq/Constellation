//
//  HomePresnet.swift
//  Constellation

import UIKit

class HomePresent: HomePresentProtocal {

    var interactor: HomeInputInteractorProtocal?
    weak var view: HomeViewProtocal?
    var wireFrame: HomeWireFrameProtocal?
    
    func viewDidLoad() {
        interactor?.getData()    
    }
    
    func selectConstellation(_ constellation: MyConstellation, vc: UIViewController) {
        wireFrame?.navigationPush(with: constellation, vc: vc)
    }
    
}

extension HomePresent: HomeOutputInteractorProtocal {
    func getData(_ data: [MyConstellation]) {
        view?.showConstellation(data)
    }
}
