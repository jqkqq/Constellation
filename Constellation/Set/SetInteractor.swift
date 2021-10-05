//
//  SetInteractor.swift
//  Constellation

import Foundation

class SetInteractor: SetInteractorProtocal {
    
    func generate() -> [UserSet] {
        return [UserSet(title: "联络我们", image: "contact"),
                UserSet(title: "关于我们", image: "about"),
                UserSet(title: "版本号", image: "version")]
    }

}
