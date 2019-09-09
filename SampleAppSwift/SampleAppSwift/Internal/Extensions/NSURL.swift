//
//  NSURL.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

extension URL {
    var params: [String: String]? {
        if let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) {
            if let queryItems = urlComponents.queryItems {
                var params = [String: String]()
                queryItems.forEach {
                    params[$0.name] = $0.value
                }
                return params
            }
        }
        return nil
    }
}
