//
//  HomeProtocal.swift
//  Constellation

import Foundation
import UIKit

protocol HomeViewProtocal: class {
    //present -> view
    func showConstellation(_ constellation: [MyConstellation])
}

protocol HomePresentProtocal: class {
    var interactor: HomeInputInteractorProtocal? { get set }
    var view: HomeViewProtocal? { get set }
    var wireFrame: HomeWireFrameProtocal? { get set }
    //view -> present
    func viewDidLoad()
    func selectConstellation(_ constellation: MyConstellation, vc: UIViewController)
}

protocol HomeInputInteractorProtocal: class {
    var present: HomeOutputInteractorProtocal? { get set }
    //presnet -> interactor
    func getData()
}

protocol HomeOutputInteractorProtocal: class {
    //interactor -> present
    func getData(_ data: [MyConstellation])
}

protocol HomeWireFrameProtocal: class {
    //present -> wireFrame
    func navigationPush(with constellation: MyConstellation, vc: UIViewController)
    static func createHomeModule(viewController: HomeViewController)
}
