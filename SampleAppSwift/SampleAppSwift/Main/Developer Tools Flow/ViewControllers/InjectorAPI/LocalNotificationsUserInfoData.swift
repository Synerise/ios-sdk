//
//  LocalNotificationsUserInfoData.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class LocalNotificationsUserInfoData {

    static func getSimplePush1UserInfo() -> [AnyHashable: Any] {
        return [
                "aps": [
                    "alert": [
                        "title": "Simple Push",
                        "body": "OPEN_APP"
                    ]
                ],
                "issuer": "Synerise",
                "message-type": "dynamic-content",
                "content-type": "simple-push",
                "content": [
                    "campaign": [
                        "variant_id": 1,
                        "hash_id": "HASH",
                        "type": "CAMPAIGN_TYPE",
                        "title": "CAMPAIGN_TITLE"
                    ],
                    "notification": [AnyHashable: Any]()
                ]
            ]
    }
    
    static func getSimplePush2UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "alert": [
                    "title": "Simple Push",
                    "body": "OPEN_URL"
                ]
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "simple-push",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "notification": [
                    "action": [
                        "type": "OPEN_URL",
                        "item": "http://www.google.pl"
                    ]
                ]
            ]
        ]
    }
    
    static func getSimplePush3UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "alert": [
                    "title": "Simple Push",
                    "body": "OPEN_DEEPLINK"
                ]
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "simple-push",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "notification": [
                    "action": [
                        "type": "OPEN_DEEPLINK",
                        "item": "deeplink_example"
                    ]
                ]
            ]
        ]
    }
    
    static func getRichMedia1UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "alert": [
                    "title": "Rich Media",
                    "body": "Single Image"
                ]
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "simple-push",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "notification": [AnyHashable: Any](),
                "rich-media": [
                    "type": "single-image",
                    "single-image": [
                        "url": "https://pbs.twimg.com/profile_images/948179320702492672/OLYEDJdS_400x400.jpg"
                    ]
                ]
            ]
        ]
    }
    
    static func getRichMedia2UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "alert": [
                    "title": "Rich Media",
                    "body": "Carousel PORTRAIT"
                ]
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "simple-push",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "notification": [AnyHashable: Any](),
                "rich-media": [
                    "type": "carousel",
                    "carousel": [
                        "orientation": "PORTRAIT",
                        "items": [
                            [
                                "caption": "Go to WWW.GOOGLE.PL",
                                "subcaption": "Synerise 1",
                                "image": "https://mamstartup.pl/i/articles/5799_newl.jpg",
                                "url": "http://www.google.pl"
                            ],
                            [
                                "caption": "Go to WWW.SYNERISE.COM",
                                "subcaption": "Synerise 2",
                                "image": "https://mamstartup.pl/i/articles/5799_newl.jpg",
                                "url": "http://www.synerise.com"
                            ],
                            [
                                "caption": "Go to WWW.WP.PL",
                                "subcaption": "Synerise 3",
                                "image": "https://mamstartup.pl/i/articles/5799_newl.jpg",
                                "url": "http://www.wp.pl"
                            ]
                        ]
                    ]
                ]
            ]
        ]
    }
    
    static func getRichMedia3UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "alert": [
                    "title": "Rich Media",
                    "body": "Carousel LANDSCAPE"
                ]
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "simple-push",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "notification": [AnyHashable: Any](),
                "rich-media": [
                    "type": "carousel",
                    "carousel": [
                        "orientation": "LANDSCAPE",
                        "items": [
                            [
                                "caption": "Go to WWW.GOOGLE.PL",
                                "subcaption": "Synerise 1",
                                "image": "https://mamstartup.pl/i/articles/5799_newl.jpg",
                                "url": "http://www.google.pl"
                                ],
                            [
                                "caption": "Go to WWW.SYNERISE.COM",
                                "subcaption": "Synerise 2",
                                "image": "https://mamstartup.pl/i/articles/5799_newl.jpg",
                                "url": "http://www.synerise.com"
                                ],
                            [
                                "caption": "Go to WWW.WP.PL",
                                "subcaption": "Synerise 3",
                                "image": "https://mamstartup.pl/i/articles/5799_newl.jpg",
                                "url": "http://www.wp.pl"
                                ]
                        ]
                    ]
                ]
            ]
        ]
    }
}
