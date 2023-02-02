//
//  LocalNotificationsUserInfoData.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

//swiftlint:disable:next type_body_length
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
                        "type": "DEEP_LINKING",
                        "item": "sample-swift://flow/left-menu/settings"
                    ]
                ]
            ]
        ]
    }
    
    static func getSimplePush4UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "alert": [
                    "title": "Simple Push",
                    "body": "BUTTONS"
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
                        "type": "OPEN_APP"
                    ]
                ],
                "buttons": [
                    [
                        "identifier": "button1",
                        "text": "OPEN_URL",
                        "action": [
                            "type": "OPEN_URL",
                            "item": "http://www.google.pl"
                        ]
                    ],
                    [
                        "identifier": "button2",
                        "text": "DEEP_LINKING",
                        "action": [
                            "type": "DEEP_LINKING",
                            "item": "syne://product?sku=1"
                        ]
                    ],
                    [
                        "identifier": "button3",
                        "text": "OPEN_APP",
                        "action": [
                            "type": "OPEN_APP"
                        ]
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
                        "image": "https://s.sdgcdn.com/7/2020/05/Website_SpecialDeals_Laptops-02.jpg"
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
                                "image": "https://pbs.twimg.com/profile_images/948179320702492672/OLYEDJdS_400x400.jpg",
                                "url": "http://www.google.pl"
                            ],
                            [
                                "caption": "Go to WWW.SYNERISE.COM",
                                "subcaption": "Synerise 2",
                                "image": "https://pbs.twimg.com/profile_images/948179320702492672/OLYEDJdS_400x400.jpg",
                                "url": "http://www.synerise.com"
                            ],
                            [
                                "caption": "Go to WWW.WP.PL",
                                "subcaption": "Synerise 3",
                                "image": "https://pbs.twimg.com/profile_images/948179320702492672/OLYEDJdS_400x400.jpg",
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
                                "image": "https://pbs.twimg.com/profile_images/948179320702492672/OLYEDJdS_400x400.jpg",
                                "url": "http://www.google.pl"
                                ],
                            [
                                "caption": "Go to WWW.SYNERISE.COM",
                                "subcaption": "Synerise 2",
                                "image": "https://pbs.twimg.com/profile_images/948179320702492672/OLYEDJdS_400x400.jpg",
                                "url": "http://www.synerise.com"
                                ],
                            [
                                "caption": "Go to WWW.WP.PL",
                                "subcaption": "Synerise 3",
                                "image": "https://pbs.twimg.com/profile_images/948179320702492672/OLYEDJdS_400x400.jpg",
                                "url": "http://www.wp.pl"
                                ]
                        ]
                    ]
                ]
            ]
        ]
    }
    
    static func getBannerTemplate1UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "content-available": 1
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "template-banner",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "page": [
                    "index": 0,
                    "type": "color_as_background",
                    "background": [
                            "color": "#ffffff",
                            "alpha": 1
                    ],
                    "header": [
                        "text": "Banner",
                        "color": "#000000",
                            "alpha": 1,
                            "size": 65
                        ],
                    "description": [
                        "text": "Color As Background",
                        "color": "#555555",
                        "alpha": 1,
                        "size": 30
                    ],
                    "button": [
                        "is_enabled": false,
                        "color": "#f9fafb",
                        "text": "URL: www.google.pl",
                        "text_color": "#384350",
                        "corner_radius": 5
                    ],
                    "close_button": [
                        "is_enabled": true,
                        "alignment": "right"
                    ],
                    "action": [
                        "type": "OPEN_URL",
                        "item": "http://www.google.pl"
                    ]
                ]
            ]
        ]
    }
    
    static func getBannerTemplate2UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "content-available": 1
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "template-banner",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "page": [
                    "index": 0,
                    "type": "image_as_background",
                    "background": [
                        "color": "#123456",
                        "alpha": 0.5
                    ],
                    "image": [
                        "url": "https://i.pinimg.com/originals/b5/41/8d/b5418dcc2ab6efa7fe51d8bffd385343.jpg"
                    ],
                    "button": [
                        "is_enabled": true,
                        "color": "#ffffff",
                        "text": "URL: www.wp.pl",
                        "text_color": "#333333",
                        "corner_radius": 5
                    ],
                    "close_button": [
                        "is_enabled": true,
                        "alignment": "left"
                    ],
                    "action": [
                        "type": "OPEN_URL",
                        "item": "http://www.wp.pl"
                    ]
                ],
                "auto_disappear": [
                    "is_enabled": true,
                    "timeout": 5
                ]
            ]
        ]
    }
    
    static func getBannerTemplate3UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "content-available": 1
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "template-banner",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "page": [
                    "index": 0,
                    "type": "image_with_text_atop",
                    "background": [
                        "color": "#123456",
                        "alpha": 0.5
                    ],
                    "image": [
                        "url": "https://i.pinimg.com/originals/b5/41/8d/b5418dcc2ab6efa7fe51d8bffd385343.jpg"
                    ],
                    "header": [
                        "text": "Sample text",
                        "color": "#384350",
                        "alpha": 0.8,
                        "size": 20
                    ],
                    "description": [
                        "text": "Sample description",
                        "color": "#384350",
                        "alpha": 0.8,
                        "size": 20
                    ],
                    "button": [
                        "is_enabled": true,
                        "color": "#f9fafb",
                        "text": "DEEPLINK: deep_linking_key",
                        "text_color": "#384350",
                        "corner_radius": 5
                    ],
                    "close_button": [
                        "is_enabled": true,
                        "alignment": "right"
                    ],
                    "action": [
                        "type": "DEEP_LINKING",
                        "item": "deep_linking_key"
                    ]
                ],
                "auto_disappear": [
                    "is_enabled": true,
                    "timeout": 5
                ]
            ]
        ]
    }
    
    static func getBannerTemplate4UserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "content-available": 1
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "template-banner",
            "content": [
                "campaign": [
                    "variant_id": 1,
                    "hash_id": "HASH",
                    "type": "CAMPAIGN_TYPE",
                    "title": "CAMPAIGN_TITLE"
                ],
                "page": [
                    "index": 0,
                    "type": "image_with_text_below",
                    "background": [
                        "color": "#123456",
                        "alpha": 0.2
                    ],
                    "image": [
                        "url": "https://camo.mybb.com/e01de90be6012adc1b1701dba899491a9348ae79/687474703a2f2f7777772e6a71756572797363726970742e6e65742f696d616765732f53696d706c6573742d526573706f6e736976652d6a51756572792d496d6167652d4c69676874626f782d506c7567696e2d73696d706c652d6c69676874626f782e6a7067"
                    ],
                    "header": [
                        "text": "Test",
                        "color": "#ffffff",
                        "alpha": 0.8,
                        "size": 20
                    ],
                    "description": [
                        "text": "Test",
                        "color": "#ffffff",
                        "alpha": 0.8,
                        "size": 20
                    ],
                    "button": [
                        "is_enabled": false,
                        "color": "#ffffff",
                        "text": "URL: www.wp.pl",
                        "text_color": "#666666",
                        "corner_radius": 5
                    ],
                    "close_button": [
                        "is_enabled": true,
                        "alignment": "left"
                    ],
                    "action": [
                        "type": "OPEN_URL",
                        "item": "http://www.wp.pl"
                    ]
                ],
                "auto_disappear": [
                    "is_enabled": true,
                    "timeout": 5
                ]
            ]
        ]
    }
    
    static func getGetLocationSDKCommandUserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "content-available": 1
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "silent-sdk-command",
            "content": [
                "class_name": "com.synerise.sdk.injector.Injector",
                "method_name": "GET_LOCATION",
                "method_parameters": []
            ]
        ]
    }
    
    static func getSignOutSDKCommandUserInfo() -> [AnyHashable: Any] {
        return [
            "aps": [
                "content-available": 1
            ],
            "issuer": "Synerise",
            "message-type": "dynamic-content",
            "content-type": "silent-sdk-command",
            "content": [
                "class_name": "com.synerise.sdk.injector.Injector",
                "method_name": "SIGN_OUT",
                "method_parameters": []
            ]
        ]
    }
}
