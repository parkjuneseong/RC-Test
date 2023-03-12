//
//  MyPageModel.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import Foundation


import Foundation

struct MyPageModel: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: MyPageResultModel?
    
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
        result = try values.decodeIfPresent(MyPageResultModel.self, forKey: .result)
    }
}

struct MyPageResultModel: Codable {
    let userId: Int?
    let profileImageUrl: String?
    let userNickName: String?
    let content : String?
    let scoreAvg : Float?
    let openDay : String?
    let userStatusCheck : String?
    
    enum CodingKeys: String, CodingKey {
        case userId
        case profileImageUrl
        case userNickName
        case content
        case scoreAvg
        case openDay
        case userStatusCheck
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        profileImageUrl = try values.decodeIfPresent(String.self, forKey: .profileImageUrl)
        userNickName = try values.decodeIfPresent(String.self, forKey: .userNickName)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        scoreAvg = try values.decodeIfPresent(Float.self, forKey: .scoreAvg)
        openDay = try values.decodeIfPresent(String.self, forKey: .openDay)
        userStatusCheck = try values.decodeIfPresent(String.self, forKey: .userStatusCheck)
    }
}
