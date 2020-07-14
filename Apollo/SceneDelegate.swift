//
//  SceneDelegate.swift
//  Apollo
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let planStore = PlanStore();
    let weightStore = WeightStore();
    let locationController = LocationController();

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        let navController = self.window!.rootViewController as! UINavigationController;
        let plansController = navController.topViewController as! PlansViewController;
        plansController.planStore = self.planStore;
        plansController.weightStore = self.weightStore;
        plansController.locationController = self.locationController;
        
        HealthKitController.fetchWeight();
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
        if !self.locationController.isUpdatingLocationStopped()
        {
            self.locationController.startUpdatingLocation();
        }
        
        UIApplication.shared.isIdleTimerDisabled = true;
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call)
        self.locationController.stopUpdatingLocation();
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        if !self.locationController.isUpdatingLocationStopped()
        {
            self.locationController.startUpdatingLocation();
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        self.locationController.stopUpdatingLocation();
        UIApplication.shared.isIdleTimerDisabled = false;
        
        let success = self.planStore.encode();
        
        if (success)
        {
            print("Saved all changes.");
        }
        else
        {
            print("Could not save any change.");
        }
    }
}

