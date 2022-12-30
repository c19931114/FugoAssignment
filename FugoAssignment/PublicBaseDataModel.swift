//
//  PublicBaseDataModel.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/24.
//

import Foundation

struct PublicBaseDataAPIModel: Codable {
    let 公司代號, 公司簡稱, 公司名稱, 網址: String?
    let 董事長, 總經理, 成立日期, 上市日期: String?
    let 產業別: TSE?
    let 總機電話, 營利事業統一編號, 住址: String?
    let 實收資本額, 普通股每股面額, 私募股數, 特別股: String?
}

extension PublicBaseDataAPIModel: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.公司代號 == rhs.公司代號
    }
}

enum TSE: String, Codable, CaseIterable {
    case 未定義 = "XX"
    case 水泥工業 = "01"
    case 食品工業 = "02"
    case 塑膠工業 = "03"
    case 紡織工業 = "04"
    case 電機機械 = "05"
    case 電器電纜 = "06"
    case 化學生技業 = "07"
    case 玻璃陶瓷 = "08"
    case 造紙工業 = "09"
    case 鋼鐵工業 = "10"
    case 橡膠工業 = "11"
    case 汽車工業 = "12"
    case 電子工業 = "13"
    case 建材營造 = "14"
    case 航運 = "15"
    case 觀光 = "16"
    case 金融 = "17"
    case 貿易百貨 = "18"
    case 綜合 = "19"
    case 其他 = "20"
    case 化學工業 = "21"
    case 生技醫療 = "22"
    case 油電燃氣 = "23"
    case 半導體業 = "24"
    case 電腦及週邊設備業 = "25"
    case 光電業 = "26"
    case 通訊網路業 = "27"
    case 電子零組件業 = "28"
    case 電子通路業 = "29"
    case 資訊服務業 = "30"
    case 其他電子業 = "31"
    case 管理股票 = "80"
    case 台灣存託憑證 = "91"
    case 社會企業 = "97"
    case 農林漁牧 = "98"
}

