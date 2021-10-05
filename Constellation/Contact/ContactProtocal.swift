//
//  ContactProtocal.swift
//  Constellation

import UIKit

protocol ContactViewProtocal: class {
    func showLabel(name: String, email: String, detail: String)
}

protocol ContactPresentProtocal: class {
    var view: ContactViewProtocal? { get set }
    var wireFrame: ContactWireFrameProtocal? { get set }
    var interactor: ContactInputInteractorProtocal? { get set }
    
    func viewDidLoad()
    func presentData()
}

protocol ContactInputInteractorProtocal: class {
    var present: ContactOutputInteractorProtocal? { get set }
    func setData()
}

protocol ContactOutputInteractorProtocal: class {
    func fetchData(name: String, email: String, detail: String)
}

protocol ContactWireFrameProtocal: class {
    static func createModule(vc: ContactViewController)
}
