//
//  MatchWireFrame.swift
//  Constellation


import UIKit

class MatchWireFrame: MatchWireFrameProtocal {    

    static func createModule(viewController: MatchViewController) {
        let present: MatchPresentProtocal & MatchInteractorOutputProtocal = MatchPresent()
        viewController.present = present
        viewController.present?.view = viewController
        viewController.present?.interactor = MatchInteractor()
        viewController.present?.wireFrame = MatchWireFrame()
        viewController.present?.interactor?.present = present
    }
    
    func navigationPush(vc: UIViewController) {
        
    }
    
}
