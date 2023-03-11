////
////  HomeBabberModel.swift
////  RC Test
////
////  Created by 박준성 on 2023/03/11.
//
//import Foundation
//
//struct HomeProductsModel: Codable {
//    let isSuccess: Bool?
//    let code: Int?
//    let message: String?
//    let result: HomeProductsResultModel?
//    
//    enum CodingKeys: String, CodingKey {
//        case isSuccess
//        case code
//        case message
//        case result
//    }
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        isSuccess = try values.decodeIfPresent(Bool.self, forKey: .isSuccess)
//        code = try values.decodeIfPresent(Int.self, forKey: .code)
//        message = try values.decodeIfPresent(String.self, forKey: .message)
//        result = try values.decodeIfPresent(HomeProductsResultModel.self, forKey: .result)
//    }
//}
//
//struct HomeProductsResultModel: Codable {
//    let productId: Int?
//    let price: String?
//    let title : String?
//    let isSagePay : String?
//    let tradeStatus : String?
//    let status : String?
//    let productImgs : [productImgs]?
//    
//    struct productImgs : Codable {
//        let productImgUrlId : Int?
//        let imageUrl : String?
//    }
//    enum CodingKeys: String, CodingKey {
//        case productId
//        case price
//        case title
//        case isSagePay
//        case tradeStatus
//        case status
//        case productImgs
//    }
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
//        price = try values.decodeIfPresent(String.self, forKey: .price)
//        title = try values.decodeIfPresent(String.self, forKey: .title)
//        isSagePay = try values.decodeIfPresent(String.self, forKey: .isSagePay)
//        tradeStatus = try values.decodeIfPresent(String.self, forKey: .tradeStatus)
//        status = try values.decodeIfPresent(String.self, forKey: .status)
////        productImgs = try values.decodeIfPresent([productImgs].self, forKey: .productImgs)
//        
//    }
//}
