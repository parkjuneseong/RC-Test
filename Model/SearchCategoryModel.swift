//
//  SearchCategoryModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/12.
//

import Foundation

import Foundation

struct SearchCategoryModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: SearchCategoryResultModel?
    
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
        result = try values.decodeIfPresent(SearchCategoryResultModel.self, forKey: .result)
    }
}

struct SearchCategoryResultModel: Codable {
    let productId: Int?
    let title: String?
    let price : String?
    let isSagePay : Bool?
    let imageUrl : String?
    
    enum CodingKeys: String, CodingKey {
        case productId
        case title
        case price
        case isSagePay
        case imageUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        isSagePay = try values.decodeIfPresent(Bool.self, forKey: .isSagePay)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}
