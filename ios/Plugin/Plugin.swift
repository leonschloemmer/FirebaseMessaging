import Foundation
import Capacitor

import FirebaseCore
import FirebaseMessaging
import FirebaseInstanceID

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(LSFirebaseMessagingPlugin)
public class LSFirebaseMessagingPlugin: CAPPlugin {
	
	override public func load() {
		Messaging.messaging().delegate = self
	}
	
    @objc func getLatestToken(_ call: CAPPluginCall) {
//		print("get token called")
		InstanceID.instanceID().instanceID { (result, error) in
			if let error = error {
				call.error(error.localizedDescription)
			}
			if let result = result {
				call.success(["value": result.token])
			}
		}
    }
}

extension LSFirebaseMessagingPlugin : MessagingDelegate {
	@nonobjc func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
		self.notifyListeners("fcmTokenReceived", data: [
			"token": fcmToken
		])
	}
}

