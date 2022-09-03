//
//  Enviroment.swift
//  MP_APP
//
//  Created by Erison Veshi on 03/09/2022.
//

import Foundation

enum APIKeys: String {
    case polygon
    
    var dictionaryKey: String {
        switch self {
        case .polygon:
            return "POLYGON_API_KEY"
        }
    }
}

protocol EnviromentConfigProvider {
    var polygonApiKey: String { get }
}

public struct EnviromentConfig {
    typealias DefaultDictionary = Dictionary<String, Any>
    
    // TODO: - Add loader to a new 
    private var defaultConfig: DefaultDictionary {
        #if DEBUG
            getDictionaryFrom(fileName: "debug_keys", ofType: "plist")
        #else
            getDictionaryFrom(fileName: "prod_keys", ofType: "plist")
        #endif
    }
    
    private func getDictionaryFrom(fileName: String, ofType fileType: String) -> DefaultDictionary {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) else {
            fatalError("Unable to find resource with fileName: \(fileName), fileType: \(fileType)")
        }
        guard let dictionary = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Unable to cast resource of type: \(fileType) to NSDictionary")
        }
        
        guard let keys = dictionary.allKeys as? [String] else {
            fatalError("Unable to extract keys from NSDictionary: \(dictionary)")
        }
        
        return dictionary.dictionaryWithValues(forKeys: keys)
    }
}

extension EnviromentConfig: EnviromentConfigProvider {
    var polygonApiKey: String {
        let key = APIKeys.polygon.dictionaryKey
        guard let value = defaultConfig[key] as? String else {
            fatalError("Failed to get the value for the specified key: \(key)")
        }
        return value
    }
}
