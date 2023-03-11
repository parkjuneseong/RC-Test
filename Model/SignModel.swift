//
//  SignModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import Foundation

struct SignModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: SignResultModel?
    
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
        result = try values.decodeIfPresent(SignResultModel.self, forKey: .result)
    }
}

struct SignResultModel: Codable {
    let jwt: String?
    let userId: Int?
    
    enum CodingKeys: String, CodingKey {
        case jwt
        case userId
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        jwt = try values.decodeIfPresent(String.self, forKey: .jwt)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
    }
}
