//
//  LoginModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/12.
//

import Foundation

struct LoginModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: LoginResultModel?
    
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
        result = try values.decodeIfPresent(LoginResultModel.self, forKey: .result)
    }
}

struct LoginResultModel: Codable {
    let userId: Int?
    let jwt: String?
    
    enum CodingKeys: String, CodingKey {
        case userId
        case jwt
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        jwt = try values.decodeIfPresent(String.self, forKey: .jwt)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
    }
}
