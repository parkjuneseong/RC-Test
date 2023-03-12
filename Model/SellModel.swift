//
//  SellModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/12.
//
 
import Foundation

struct SellModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: SellResultModel?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess
        case code
        case message
        case result
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isSuccess = try values.decodeIfPresent(Bool.self, forKey: .isSuccess)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        result = try values.decodeIfPresent(SellResultModel.self, forKey: .result)
    }
}

struct SellResultModel: Codable {
    let productId: Int?
    let userId: Int?
    let title : String?
    let price : Int?
    let tradeStatus : String?
    let ImageUrl : String?
    
    enum CodingKeys: String, CodingKey {
        case productId
        case userId
        case title
        case price
        case tradeStatus
        case ImageUrl
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        tradeStatus = try values.decodeIfPresent(String.self, forKey: .tradeStatus)
        ImageUrl = try values.decodeIfPresent(String.self, forKey: .ImageUrl)
    }
}
