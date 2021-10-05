//
//  SetPresent.swift
//  Constellation

import UIKit

class SetPresent: SetPresentProtocal {

    var view: SetViewProtocal?
    var interactor: SetInteractorProtocal?
    var wireFrame: SetWireFrameProtocal?
    
    func viewDidLoad() {
        setData()
    }
    
    func setData() {
        view?.getUserSet(data: interactor?.generate() ?? [])
        view?.tableReload()
    }
    
    func selectUserSet(userSet: UserSet, vc: UIViewController) {
        switch userSet.title {
        case "联络我们":
            wireFrame?.navigation(vc: vc)
        case "关于我们":
            view?.showAlert()
        case "版本号":
            view?.showVersion()
        default:
            break
        }
    }
}
