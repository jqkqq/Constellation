//
//  HomeWireFrame.swift
//  Constellation

import UIKit

class HomeWireFrame: HomeWireFrameProtocal {
    func navigationPush(with constellation: MyConstellation, vc: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let selectDetailVC = storyboard.instantiateViewController(withIdentifier: "SelectDetailVC") as? SelectDetailViewController {
            SelectDetailWireFrame.creatDetailModule(constellation, viewController: selectDetailVC )
            
            vc.navigationController?.pushViewController(selectDetailVC, animated: true)
        }
    }
    
    static func createHomeModule(viewController: HomeViewController) {
        let present: HomePresentProtocal & HomeOutputInteractorProtocal = HomePresent()
        viewController.present = present
        viewController.present?.wireFrame = HomeWireFrame()
        viewController.present?.view = viewController
        viewController.present?.interactor = HomeInteractor()
        viewController.present?.interactor?.present = present
    }
    
}
