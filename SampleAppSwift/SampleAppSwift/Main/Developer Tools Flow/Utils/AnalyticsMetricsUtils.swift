//
//  AnalyticsMetricsUtils.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class AnalyticsMetricsUtils {
    
    let analyticsMetrics: [AnalyticsMetrics]?
    
    // MARK: - Init
    
    init(analyticsMetrics: [AnalyticsMetrics]) {
        self.analyticsMetrics = analyticsMetrics
    }
    
    // MARK: - Public
    
    // swiftlint:disable:next cyclomatic_complexity
    func getStringRepresentation() -> String? {
        var stringDescription = ""
        
        guard let analyticsMetrics = analyticsMetrics else { return nil }
        
        for item in analyticsMetrics {
            if let result = item.result {
                stringDescription += "Result: \(result)\n"
            } else {
                stringDescription += "nil\n"
            }
            
            if let clientMetrics = item.clientMetrics {
                if clientMetrics.isEmpty {
                    stringDescription += "ClientMetrics: 0 elements\n"
                } else {
                    for item in clientMetrics {
                        stringDescription += "ClientMetrics: \(item)\n"
                    }
                }
            } else {
                stringDescription += "ClientMetrics: nil\n"
            }
            
            if let eventMetrics = item.eventMetrics {
                if eventMetrics.isEmpty {
                    stringDescription += "EventMetrics: 0 elements\n"
                } else {
                    for item in eventMetrics {
                        stringDescription += "EventMetrics: \(item)\n"
                    }
                }
            } else {
                stringDescription += "EventMetrics: nil\n"
            }
            
            if let numberMetrics = item.numberMetrics {
                if numberMetrics.isEmpty {
                    stringDescription += "NumberMetrics: 0 elements\n"
                } else {
                    for item in numberMetrics {
                        stringDescription += "NumberMetrics: \(item)\n"
                    }
                }
            } else {
                stringDescription += "NumberMetrics: nil\n"
            }
            
            if let metricData = item.metricData {
                stringDescription += "\nMetric Data:\n"
                for item in metricData {
                    print("Key: \(item.key) Value: \(item.value)")
                    stringDescription += "Key: \(item.key) Value: \(item.value)\n"
                }
            }
            
            stringDescription += "--------------------------------------------------------\n\n"
        }
        
        return stringDescription
    }
}
