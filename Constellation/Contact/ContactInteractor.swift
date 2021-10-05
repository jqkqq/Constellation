//
//  ContactInteractor.swift
//  Constellation

import Foundation

class ContactInteractor: ContactInputInteractorProtocal {
    
    var present: ContactOutputInteractorProtocal?
    
    func setData() {
        let name = "Swimhead"
        let email = "jqkqq7895@gmail.com"
        let detail = "非常感谢各位下载，若有任何建议欢迎提供并email告知，感谢各位！"
        present?.fetchData(name: name, email: email, detail: detail)
    }
    
}
