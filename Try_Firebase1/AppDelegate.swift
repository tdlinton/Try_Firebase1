//
//  AppDelegate.swift
//  Try_Firebase1
//
//  Created by Thomas Linton on 3/15/18.
//  Copyright © 2018 Thomas Linton. All rights reserved.
//

import UIKit

import Firebase

struct Constants {
    static let AnalyticsEnabled = "firebase_analytics_collection_enabled"
    static let CrashlyticsEnabled = "firebase_crashlytics_collection_enabled"
        
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    // METHOD A
    /*
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setDefaultsFromSettingsBundle()

        // Initialize Firebase Analytics
        FirebaseApp.configure()
        let enableAnalytics = UserDefaults.standard.bool(forKey: Constants.AnalyticsEnabled)
        AnalyticsConfiguration.shared().setAnalyticsCollectionEnabled(enableAnalytics)

        // Initialize Crashlytics
        if UserDefaults.standard.bool(forKey: Constants.CrashlyticsEnabled)
        {
            Fabric.with([Crashlytics.self])
        }

        // Print out settings
        if UserDefaults.standard.bool(forKey: Constants.AnalyticsEnabled)
        {
            print("analytics enabled")
        } else {
            print("analytics disabled")
        }
        if UserDefaults.standard.bool(forKey: Constants.CrashlyticsEnabled)
        {
            print("crashlytics enabled")
        } else {
            print("crashlytics disabled")
        }

        return true
    }
    */
    
    // METHOD B [need to add CrashlyticsDelegation protocol to AppDelegate]
    /*
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setDefaultsFromSettingsBundle()
        
        // Initialize Firebase Analytics
        FirebaseApp.configure()
        let enableAnalytics = UserDefaults.standard.bool(forKey: Constants.AnalyticsEnabled)
        AnalyticsConfiguration.shared().setAnalyticsCollectionEnabled(enableAnalytics)
        
        Crashlytics.sharedInstance().delegate = self
        
        // Print out settings
        if UserDefaults.standard.bool(forKey: Constants.AnalyticsEnabled)
        {
            print("analytics enabled")
        } else {
            print("analytics disabled")
        }
        if UserDefaults.standard.bool(forKey: Constants.CrashlyticsEnabled)
        {
            print("crashlytics enabled")
        } else {
            print("crashlytics disabled")
        }
        
        return true
    }
    
    // for METHOD B:
    
    func crashlyticsDidDetectReport_B(forLastExecution report: CLSReport, completionHandler: @escaping (Bool) -> Void)
    {
        let shouldSendCrashReport = UserDefaults.standard.bool(forKey: Constants.CrashlyticsEnabled)
        completionHandler(shouldSendCrashReport)
    }
 */

    // METHOD C - crashes on startup in call to Fabric.with
    /*
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setDefaultsFromSettingsBundle()
        
        // Print out settings
        if UserDefaults.standard.bool(forKey: Constants.AnalyticsEnabled)
        {
            print("analytics enabled")
        } else {
            print("analytics disabled")
        }
        if UserDefaults.standard.bool(forKey: Constants.CrashlyticsEnabled)
        {
            print("crashlytics enabled")
        } else {
            print("crashlytics disabled")
        }

        
        // NO Firebase Analytics
 
        // Initialize Crashlytics
        if UserDefaults.standard.bool(forKey: Constants.CrashlyticsEnabled)
        {
            Fabric.with([Crashlytics.self])
        }
        
        
        return true
    }
 */

   // Method E: turn on Crashlytics + Analytics together - WORKS
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setDefaultsFromSettingsBundle()
        
        // Print out settings
        if UserDefaults.standard.bool(forKey: Constants.AnalyticsEnabled)
        {
            print("analytics enabled")
        } else {
            print("analytics disabled")
        }
        if UserDefaults.standard.bool(forKey: Constants.CrashlyticsEnabled)
        {
            print("crashlytics enabled")
        } else {
            print("crashlytics disabled")
        }
        
        
        // Switch for Analytics + Crashlytics together

        if UserDefaults.standard.bool(forKey: Constants.CrashlyticsEnabled)
        {
            FirebaseApp.configure()
            AnalyticsConfiguration.shared().setAnalyticsCollectionEnabled(true)
            Fabric.with([Crashlytics.self])
        }
        
        return true
    }
 

    
    func setDefaultsFromSettingsBundle() {
        //Read PreferenceSpecifiers from Root.plist in Settings.Bundle
        if let settingsURL = Bundle.main.url(forResource: "Root", withExtension: "plist", subdirectory: "Settings.bundle"),
            let settingsPlist = NSDictionary(contentsOf: settingsURL),
            let preferences = settingsPlist["PreferenceSpecifiers"] as? [NSDictionary] {
            
            for prefSpecification in preferences {
                
                if let key = prefSpecification["Key"] as? String, let value = prefSpecification["DefaultValue"] {
                    
                    //If key doesn't exists in userDefaults then register it, else keep original value
                    if UserDefaults.standard.value(forKey: key) == nil {
                        
                        UserDefaults.standard.set(value, forKey: key)
                        NSLog("registerDefaultsFromSettingsBundle: Set following to UserDefaults - (key: \(key), value: \(value), type: \(type(of: value)))")
                    }
                }
            }
        } else {
            NSLog("registerDefaultsFromSettingsBundle: Could not find Settings.bundle")
        }
    }
}

