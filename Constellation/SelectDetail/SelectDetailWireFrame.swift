//
//  SelectDetailWireFrame.swift
//  Constellation

import Foundation

class SelectDetailWireFrame: SelectDetailWireFrameProtocal {
    
    static func creatDetailModule(_ constellation: MyConstellation, viewController: SelectDetailViewController) {
        let present: SelectDetailPresentProtocal & SelectDetailOutputInteractorProtocal = SelectDetailPresent()
        viewController.present = present
        viewController.present?.view = viewController
        present.constellation = constellation
        viewController.present?.wireFrame = SelectDetailWireFrame()
        viewController.present?.interactor = SelectDetailInteractor()
        viewController.present?.interactor?.present = present
    }
}
