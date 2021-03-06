//
//  NetworkAPI.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/14.
//

import UIKit
import Alamofire //network third-party library
import SDWebImage

private let BaseUrl = "https://raw.githubusercontent.com/ZheChenJay/API-product/main/API/Shopping/"

class NetworkAPI {

    static func homeProductList(completion: @escaping (Result<[Product], Error>) -> Void) {
        AF.request(BaseUrl + "iPhone_1.json").responseData { response in //request data from Json
            switch response.result {
            case let .success(data):
                if let list = try? JSONDecoder().decode([Product].self, from: data){
                    completion(.success(list))
                }else{
                    let error = NSError(domain: "NetworkAPIDomain", code: 0, userInfo: [NSLocalizedDescriptionKey:"decode error"]) //error information
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
            
        }
    }
}

extension UIImageView {
    func sh_setImage(name: String){
        sd_setImage(with: URL(string: BaseUrl + "Image/" + name))
    }
}
