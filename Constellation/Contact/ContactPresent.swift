//
//  ContactPresent.swift
//  Constellation


import Foundation

class ContactPresent: ContactPresentProtocal {
    
    weak var view: ContactViewProtocal?
    var wireFrame: ContactWireFrameProtocal?
    var interactor: ContactInputInteractorProtocal?
    
    func viewDidLoad() {
        presentData()
    }
    
    func presentData() {
        interactor?.setData()
    }
    
    
}

extension ContactPresent: ContactOutputInteractorProtocal {
    
    func fetchData(name: String, email: String, detail: String) {
        view?.showLabel(name: name, email: email, detail: detail)
    }
    
}
