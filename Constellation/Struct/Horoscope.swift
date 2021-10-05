//
//  Horoscope.swift
//  Constellation

import Foundation

struct HoroscopeDay: Codable {
    let date: Int?
    let name, qFriend, color, datetime: String?
    let health, love, work, money: String?
    let number: Int?
    let summary, all, resultcode: String?
    let errorCode: Int?

    enum CodingKeys: String, CodingKey {
        case date, name
        case qFriend = "QFriend"
        case color, datetime, health, love, work, money, number, summary, all, resultcode
        case errorCode = "error_code"
    }
}

struct HoroscopeWeek: Codable {
    let name: String?
    let weekth: Int?
    let date, health, job, love: String?
    let money, work, resultcode: String?
    let errorCode: Int?

    enum CodingKeys: String, CodingKey {
        case name, weekth, date, health, job, love, money, work, resultcode
        case errorCode = "error_code"
    }
}

struct HoroscopeMonth: Codable {
    let date, name: String?
    let month: Int?
    let health, all, love, money: String?
    let work, happyMagic, resultcode: String?
    let errorCode: Int?

    enum CodingKeys: String, CodingKey {
        case date, name, month, health, all, love, money, work, happyMagic, resultcode
        case errorCode = "error_code"
    }
}

struct HoroscopeYear: Codable {
    let name, date: String?
    let year: Int?
    let mima: Mima?
    let career, love, health, finance: [String]?
    let luckeyStone, future, resultcode: String?
    let errorCode: Int

    enum CodingKeys: String, CodingKey {
        case name, date, year, mima, career, love, health, finance, luckeyStone, future, resultcode
        case errorCode = "error_code"
    }
}

struct Mima: Codable {
    let info: String
    let text: [String]
}

enum DayType: String {
    case today = "today"
    case tomorrow = "tomorrow"
    case week = "week"
    case month = "month"
    case year = "year"
}

enum Constellation: String {
    case 水瓶座 = "水瓶座"
    case 双鱼座 = "双鱼座"
    case 白羊座 = "白羊座"
    case 金牛座 = "金牛座"
    case 双子座 = "双子座"
    case 巨蟹座 = "巨蟹座"
    case 狮子座 = "狮子座"
    case 处女座 = "处女座"
    case 天秤座 = "天秤座"
    case 天蝎座 = "天蝎座"
    case 射手座 = "射手座"
    case 摩羯座 = "摩羯座"
}

extension Constellation {
    func changeTwoWord() -> String {
        let string = String(self.rawValue.filter({ $0 != "座" }))
        return string
    }
}

struct Horoscope {
    var dayType: DayType
    //day
    var date: String
    var name, qFriend, color, datetime: String
    var health, love, work, money: String
    var number: Int
    var summary, all: String
    //week
    var weekth: Int
    var job: String
    //month
    var month: Int
    //year
    var year: Int
    var mima: Mima?
    var finance, career: String
}

extension HoroscopeDay {
    func changeHoroscope(dayType: DayType) -> Horoscope {
        return Horoscope(dayType: dayType, date: "\(self.date ?? 0)", name: self.name ?? "", qFriend: self.qFriend ?? "", color: self.color ?? "", datetime: self.datetime ?? "", health: self.health ?? "", love: self.love ?? "", work: self.work ?? "", money: self.money ?? "", number: self.number ?? 0, summary: self.summary ?? "", all: self.all ?? "", weekth: 0, job: "", month: 0, year: 0, finance: "", career: "")
    }
}

extension HoroscopeWeek {
    func changeHoroscope() -> Horoscope {
        return Horoscope(dayType: .week, date: self.date ?? "", name: self.name ?? "", qFriend: "", color: "", datetime: "", health: self.health ?? "", love: self.love ?? "", work: self.work ?? "", money: self.money ?? "", number: 0, summary: "", all: "", weekth: self.weekth ?? 0, job: self.job ?? "", month: 0, year: 0, finance: "", career: "")
    }
}

extension HoroscopeMonth {
    func changeHoroscope() -> Horoscope {
        return Horoscope(dayType: .month, date: self.date ?? "", name: self.name ?? "", qFriend: "", color: "", datetime: "", health: self.health ?? "", love: self.love ?? "", work: self.work ?? "" , money: self.money ?? "", number: 0, summary: "", all: self.all ?? "", weekth: 0, job: "", month: self.month ?? 0, year: 0, finance: "", career: "")
    }
}

extension HoroscopeYear {
    func changeHoroscope() -> Horoscope {
        let health = self.health?.first ?? ""
        let love = self.love?.first ?? ""
        let finance = self.finance?.first ?? ""
        let career = self.career?.first ?? ""
        return Horoscope(dayType: .year, date: self.date ?? "", name: self.name ?? "", qFriend: "", color: "", datetime: "", health: health, love: love, work: "", money: "", number: 0, summary: "", all: "", weekth: 0, job: "", month: 0, year: self.year ?? 0, mima: self.mima, finance: finance, career: career)
    }
}
