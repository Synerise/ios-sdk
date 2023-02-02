//
//  InAppMessagesDictionaryData.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2022 Synerise. All rights reserved.
//

import Foundation

class InAppMessagesDictionaryData {

    static func getBasicFullscreen() -> [AnyHashable: Any] {
        return [
            "campaignHash": "12345",
            "variantIdentifier": "678910",
            "variantValue": [
                "template": "FULLSCREEN",
                "html": """
                <style>.in-app-wrapper *{font-family: 'Roboto', sans-serif;}.in-app-wrapper{text-align: center; position: relative; background: #fff; box-shadow: 0 30px 80px 0 rgba(35, 41, 54, 0.2); width: auto; padding: 15px 30px; height: 100vh; display: flex; flex-direction: column; flex-wrap: nowrap; align-content: center; justify-content: center; align-items: center;}.in-app-title{font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.5; letter-spacing: -0.67px; text-align: center; color: #13171e; margin: 12px;}.in-app-subtitle{font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: -0.47px; text-align: center; color: #13171e;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: #6a6a6a;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: transparent;}.in-app-close:after, .in-app-close:before{content: ''; position: absolute; height: 2px; width: 50%; top: 50%; left: 12px; margin-top: -1px; background: #13171e;}.in-app-close:after{-webkit-transform: rotate(-45deg); -moz-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg); height: 2px; margin-top: -2px;}.in-app-close:before{-webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg); height: 2px; margin-top: -2px;}.in-app-wrapper-inner img{width: 100%; max-width: 162px; margin-bottom: 25px;}.in-app-wrapper-inner button{margin-top: 25px; border-radius: 6px; background-color: #0b68ff; padding: 18px; color: #fff; border: 0; width: 100%; font-size: 14px;}</style> <div class='in-app-wrapper'> <link href='https://fonts.googleapis.com/css2?family=Roboto&display=swap' rel='stylesheet'> <div class='in-app-wrapper-inner'> <div class='in-app-close'></div><img src='https://upload.snrcdn.net/9bbb7035ecf3565cceed63d321d7d9b31236850d/default/origin/7976029bfade4f4c88e62f5759cb0c17.png' alt='Image'> <p class='in-app-title'>New products</p><p class='in-app-subtitle'>Let yourself be delighted with the new series of shoes for the summer </p><button>Learn more</button> </div></div><script>(function (){var close=document.querySelector('.in-app-close'); close.addEventListener('click', function (){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'close'}, 'Custom event from In-App message');}); var button=document.querySelector('.in-app-wrapper-inner button'); button.addEventListener('click', function (){SRInApp.trackCustomEvent('inapp.custom',{'action': 'call to action'}, 'Custom event from In-App message'); SRInApp.openUrl('https://www.synerise.com')});})(); </script>
                """
            ]
        ]
    }
            
    static func getBasicModal() -> [AnyHashable: Any] {
        return [
            "campaignHash": "12345",
            "variantIdentifier": "678910",
            "variantValue": [
                "template": "MODAL",
                "html": """
                <style>.in-app-wrapper *{font-family: 'Roboto', sans-serif;}.in-app-wrapper{text-align: center; position: relative; background: #00000045; box-shadow: 0 30px 80px 0 rgba(35, 41, 54, 0.2); width: auto; padding: 15px 30px; height: 100vh; display: flex; flex-direction: column; flex-wrap: nowrap; align-content: center; justify-content: center; align-items: center;}.in-app-title{font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.5; letter-spacing: -0.67px; text-align: center; color: #13171e; margin: 12px;}.in-app-subtitle{font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: -0.47px; text-align: center; color: #13171e;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: #6a6a6a;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: transparent;}.in-app-close:after, .in-app-close:before{content: ''; position: absolute; height: 2px; width: 50%; top: 50%; left: 12px; margin-top: -1px; background: #13171e;}.in-app-close:after{-webkit-transform: rotate(-45deg); -moz-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg); height: 2px; margin-top: -2px;}.in-app-close:before{-webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg); height: 2px; margin-top: -2px;}.in-app-wrapper-inner img{width: 100%; max-width: 142px; margin-bottom: 25px;}.in-app-wrapper-inner button{margin-top: 25px; border-radius: 6px; background-color: #0b68ff; padding: 18px; color: #fff; border: 0; width: 100%; font-size: 14px;}.in-app-wrapper-inner{background: #fff; border-radius: 6px; padding: 20px; position: relative;}</style> <div class='in-app-wrapper'> <link href='https://fonts.googleapis.com/css2?family=Roboto&display=swap' rel='stylesheet'> <div class='in-app-wrapper-inner'> <div class='in-app-close'></div><img src='https://upload.snrcdn.net/9bbb7035ecf3565cceed63d321d7d9b31236850d/default/origin/7976029bfade4f4c88e62f5759cb0c17.png' alt='Image'> <p class='in-app-title'>New products</p><p class='in-app-subtitle'>Let yourself be delighted with the new series of shoes for the summer </p><button>Learn more</button> </div></div><script>(function (){var close=document.querySelector('.in-app-close'); close.addEventListener('click', function (){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'close'}, 'Custom event from In-App message');}); var button=document.querySelector('.in-app-wrapper-inner button'); button.addEventListener('click', function (){SRInApp.trackCustomEvent('inapp.custom',{'action': 'call to action'}, 'Custom event from In-App message'); SRInApp.openUrl('https://www.synerise.com')}); var inapp=document.querySelector('.in-app-wrapper'); inapp.addEventListener('click', function (event){if (event.target.getAttribute('class')=='in-app-wrapper'){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'click outside modal'}, 'Custom event from In-App message');}});})(); </script>
                """
            ]
        ]
    }
    
    static func getBasicTopBar() -> [AnyHashable: Any] {
        return [
            "campaignHash": "12345",
            "variantIdentifier": "678910",
            "variantValue": [
                "template": "TOP_BAR",
                "html": """
                <style>.in-app-wrapper *{font-family: 'Roboto', sans-serif;}.in-app-wrapper{position: relative; background: #fff; box-shadow: 0 30px 80px 0 rgba(35, 41, 54, 0.2); width: auto; padding: 15px;}.in-app-title{font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.5; letter-spacing: -0.67px; text-align: center; color: #13171e; margin: 12px;}.in-app-subtitle{font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: -0.47px; text-align: center; color: #13171e;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: #6a6a6a;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: transparent;}.in-app-close:after, .in-app-close:before{content: ''; position: absolute; height: 2px; width: 50%; top: 50%; left: 12px; margin-top: -1px; background: #13171e;}.in-app-close:after{-webkit-transform: rotate(-45deg); -moz-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg); height: 2px; margin-top: -2px;}.in-app-close:before{-webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg); height: 2px; margin-top: -2px;}</style> <div class='in-app-wrapper'> <link href='https://fonts.googleapis.com/css2?family=Roboto&display=swap' rel='stylesheet'> <div class='in-app-close'></div><p class='in-app-title'>New products</p><p class='in-app-subtitle'>Let yourself be delighted with the new series of shoes for the summer </p></div><script>(function (){var close=document.querySelector('.in-app-close'); close.addEventListener('click', function (){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'close'}, 'Custom event from In-App message');});})(); </script>
                """
            ]
        ]
    }
    
    static func getBasicBottomBar() -> [AnyHashable: Any] {
        return [
            "campaignHash": "12345",
            "variantIdentifier": "678910",
            "variantValue": [
                "template": "BOTTOM_BAR",
                "html": """
                <style>.in-app-wrapper *{font-family: 'Roboto', sans-serif;}.in-app-wrapper{position: relative; background: #fff; box-shadow: 0 30px 80px 0 rgba(35, 41, 54, 0.2); width: auto; padding: 15px;}.in-app-title{font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.5; letter-spacing: -0.67px; text-align: center; color: #13171e; margin: 12px;}.in-app-subtitle{font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: -0.47px; text-align: center; color: #13171e;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: #6a6a6a;}.in-app-close{position: absolute; z-index: 1; width: 50px; height: 50px; border: 0; top: 0; right: 0; cursor: pointer; background-color: transparent;}.in-app-close:after, .in-app-close:before{content: ''; position: absolute; height: 2px; width: 50%; top: 50%; left: 12px; margin-top: -1px; background: #13171e;}.in-app-close:after{-webkit-transform: rotate(-45deg); -moz-transform: rotate(-45deg); -ms-transform: rotate(-45deg); -o-transform: rotate(-45deg); transform: rotate(-45deg); height: 2px; margin-top: -2px;}.in-app-close:before{-webkit-transform: rotate(45deg); -moz-transform: rotate(45deg); -ms-transform: rotate(45deg); -o-transform: rotate(45deg); transform: rotate(45deg); height: 2px; margin-top: -2px;}</style> <div class='in-app-wrapper'> <link href='https://fonts.googleapis.com/css2?family=Roboto&display=swap' rel='stylesheet'> <div class='in-app-close'></div><p class='in-app-title'>New products</p><p class='in-app-subtitle'>Let yourself be delighted with the new series of shoes for the summer. Hello test and hello world. It is good time! h h h h h h h h  h h h h h h h hh h h  h </p></div><script>(function (){var close=document.querySelector('.in-app-close'); close.addEventListener('click', function (){SRInApp.close(); SRInApp.trackCustomEvent('inapp.custom',{'action': 'close'}, 'Custom event from In-App message');});})(); </script>
                """
            ]
        ]
    }
}
