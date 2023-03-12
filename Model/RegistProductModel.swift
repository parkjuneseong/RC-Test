//
//  RegistProductModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/12.
//

import Foundation
struct RegistProductModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: RegistProductResultModel?
    
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
        result = try values.decodeIfPresent(RegistProductResultModel.self, forKey: .result)
    }
}

struct RegistProductResultModel: Codable {
    let productId : Int?
    
    enum CodingKeys: String, CodingKey {
        case productId
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        
    }
}
