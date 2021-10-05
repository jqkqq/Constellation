//
//  SetWireFrame.swift
//  Constellation

import UIKit

class SetWireFrame: SetWireFrameProtocal {
    static func createModule(vc: SetViewController) {
        let present: SetPresentProtocal = SetPresent()
        vc.present = present
        vc.present?.view = vc
        vc.present?.wireFrame = SetWireFrame()
        vc.present?.interactor = SetInteractor()
    }
    
    func navigation(vc: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC") as? ContactViewController {
            vc.navigationController?.pushViewController(contactVC, animated: true)
        }
    }

}
