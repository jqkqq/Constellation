//
//  ContactWireFrame.swift
//  Constellation

import Foundation

class ContactWireFrame: ContactWireFrameProtocal {
    
    static func createModule(vc: ContactViewController) {
        let present: ContactPresentProtocal & ContactOutputInteractorProtocal = ContactPresent()
        vc.present = present
        vc.present?.view = vc
        vc.present?.wireFrame = ContactWireFrame()
        vc.present?.interactor = ContactInteractor()
        vc.present?.interactor?.present = present
    }

}
