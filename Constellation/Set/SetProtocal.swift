//
//  SetProtocal.swift
//  Constellation

import UIKit

struct UserSet {
    var title: String
    var image: String
}

protocol SetViewProtocal: class {
    func getUserSet(data: [UserSet])
    func tableReload()
    func showAlert()
    func showVersion()
}

protocol SetPresentProtocal: class {
    
    var view: SetViewProtocal? { get set }
    var interactor: SetInteractorProtocal? { get set }
    var wireFrame: SetWireFrameProtocal? { get set }
    
    func viewDidLoad()
    func setData()
    func selectUserSet(userSet: UserSet, vc: UIViewController)
}

protocol SetInteractorProtocal: class {
    func generate() -> [UserSet]
}

protocol SetWireFrameProtocal: class {
    static func createModule(vc: SetViewController)
    func navigation(vc: UIViewController)
}
