//
//  GetExchange.swift
//  Constellation

import Foundation
import Alamofire

class getExchange {
    func CurrentExchange(completion: @escaping(HistoryRates, [MoneyRate]) ->Void){
        let url = "https://api.ratesexchange.eu/client/history?apiKey=6147a1f3-7b51-4089-a533-c88548ff2ec9&date=2020-07-07"
        AF.request(url).response { (response) in
            if let data = response.data {
                do {
                    let newData = try JSONDecoder().decode(HistoryRates.self, from: data)
                    let dicData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let dic = dicData, let count = dic["rates"] as? [String: Double] {
                        print(count.count)
                        print(newData)
                        var moneyRate: [MoneyRate] = []
                        count.forEach({
                            let rate = MoneyRate(name: $0, rate: $1)
                            moneyRate.append(rate)
                        })
                        completion(newData, moneyRate)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

}

struct MoneyRate {
    var name: String
    var rate: Double
}

struct HistoryRates : Codable {

    let base : String?
    let date : String?
    let rates : Rate?


    enum CodingKeys: String, CodingKey {
        case base = "base"
        case date = "date"
        case rates = "rates"
    }
}

struct Rate : Codable {
    let aUD : Float?
    let bGN : Float?
    let bRL : Float?
    let cAD : Float?
    let cHF : Float?
    let cNY : Float?
    let cZK : Float?
    let dKK : Float?
    let eUR : Float?
    let gBP : Float?
    let hKD : Float?
    let hRK : Float?
    let hUF : Float?
    let iDR : Float?
    let iLS : Float?
    let iNR : Float?
    let iSK : Float?
    let jPY : Float?
    let kRW : Float?
    let mXN : Float?
    let mYR : Float?
    let nOK : Float?
    let nZD : Float?
    let pHP : Float?
    let pLN : Float?
    let rON : Float?
    let rUB : Float?
    let sEK : Float?
    let sGD : Float?
    let tHB : Float?
    let tRYField : Float?
    let uSD : Float?
    let zAR : Float?


    enum CodingKeys: String, CodingKey {
        case aUD = "AUD"
        case bGN = "BGN"
        case bRL = "BRL"
        case cAD = "CAD"
        case cHF = "CHF"
        case cNY = "CNY"
        case cZK = "CZK"
        case dKK = "DKK"
        case eUR = "EUR"
        case gBP = "GBP"
        case hKD = "HKD"
        case hRK = "HRK"
        case hUF = "HUF"
        case iDR = "IDR"
        case iLS = "ILS"
        case iNR = "INR"
        case iSK = "ISK"
        case jPY = "JPY"
        case kRW = "KRW"
        case mXN = "MXN"
        case mYR = "MYR"
        case nOK = "NOK"
        case nZD = "NZD"
        case pHP = "PHP"
        case pLN = "PLN"
        case rON = "RON"
        case rUB = "RUB"
        case sEK = "SEK"
        case sGD = "SGD"
        case tHB = "THB"
        case tRYField = "TRY"
        case uSD = "USD"
        case zAR = "ZAR"
    }
    
}
