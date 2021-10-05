//
//  HomeInteractor.swift
//  Constellation

import Foundation

class HomeInteractor: HomeInputInteractorProtocal {
    
    var present: HomeOutputInteractorProtocal?
    
    func getData() {
        present?.getData(generateData())
    }
    
    func generateData() -> [MyConstellation] {
        return
            [MyConstellation(title: Constellation.双子座, image: "雙子"),
             MyConstellation(title: Constellation.双鱼座, image: "雙魚"),
             MyConstellation(title: Constellation.处女座, image: "處女"),
             MyConstellation(title: Constellation.天秤座, image: "天秤"),
             MyConstellation(title: Constellation.天蝎座, image: "天蠍"),
             MyConstellation(title: Constellation.射手座, image: "射手"),
             MyConstellation(title: Constellation.巨蟹座, image: "巨蟹"),
             MyConstellation(title: Constellation.摩羯座, image: "摩羯"),
             MyConstellation(title: Constellation.水瓶座, image: "水瓶"),
             MyConstellation(title: Constellation.狮子座, image: "獅子"),
             MyConstellation(title: Constellation.白羊座, image: "白羊"),
             MyConstellation(title: Constellation.金牛座, image: "金牛")]
    }
}
