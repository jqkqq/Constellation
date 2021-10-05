//
//  APIService.swift
//  Constellation

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    
    func getData(_ constellation: Constellation, dayType: DayType, completion: @escaping(Horoscope) -> Void) {
        var parameters: [String: Any] = [:]
        parameters["key"] = "2c2eda3e670018968fffc22b8c6d533d"
        parameters["consName"] = constellation.rawValue.decodeUrl() ?? ""
        parameters["type"] = dayType.rawValue
        AF.request("http://web.juhe.cn:8080/constellation/getAll", parameters: parameters).response { (response) in
            if let data = response.data {
                print(response.request?.url as Any)
                do {
                    switch dayType {
                    case .today, .tomorrow:
                        let myData = try JSONDecoder().decode(HoroscopeDay.self, from: data).changeHoroscope(dayType: dayType)
                        completion(myData)
                    case .week:
                        let myData = try JSONDecoder().decode(HoroscopeWeek.self, from: data).changeHoroscope()
                        completion(myData)
                    case .month:
                        let myData = try JSONDecoder().decode(HoroscopeMonth.self, from: data).changeHoroscope()
                        completion(myData)
                    case .year:
                        let myData = try JSONDecoder().decode(HoroscopeYear.self, from: data).changeHoroscope()
                        completion(myData)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getMatchData(men: String, women: String, completion: @escaping(Match) -> Void) {
        var parameters: [String: Any] = [:]
        parameters["key"] = "4e7db3ba5b1b3a8f793cab8985378b75"
        parameters["men"] = men
        parameters["women"] = women
        AF.request("http://apis.juhe.cn/xzpd/query", parameters: parameters).response { response in
            if let data = response.data {
                print(response.request?.url as Any)
                do {
                    let matchData = try JSONDecoder().decode(Match.self, from: data)
                    completion(matchData)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
