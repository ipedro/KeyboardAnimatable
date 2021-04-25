//
//  KeyboardAnimatable.swift
//
//  Copyright (c) 2021 Pedro Almeida
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

public protocol KeyboardAnimatable {}

public extension KeyboardAnimatable {
    
    /// Adds an entry to the notification center to call the provided selector with the notification.
    ///
    /// Unregister an observer to stop receiving notifications.
    ///
    /// To unregister an observer, use removeObserver(_:) or removeObserver(_:name:object:) with the most specific detail possible. For example, if you used a name and object to register the observer, use the name and object to remove it.
    ///
    /// If your app targets iOS 9.0 and later or macOS 10.11 and later, you do not need to unregister an observer that you created with this function. If you forget or are unable to remove an observer, the system cleans up the next time it would have posted to it.
    ///
    /// - Parameters:
    ///   - aSelector: A selector that specifies the message the receiver sends observer to alert it to the notification posting. The method that aSelector specifies must have one and only one argument (an instance of NSNotification).
    ///   - keyboardNotification: The keyboard notification to register for delivery to the observer.
    func addKeyboardNotificationObserver(with selector: Selector, when keyboardNotification: KeyboardNotificationName) {
        NotificationCenter.default.addKeyboardNotificationObserver(self, selector: selector, when: keyboardNotification)
    }
    
    /// Removes matching entries from the notification center's dispatch table.
    ///
    /// Removing the observer stops it from receiving notifications.
    ///
    /// If you used addObserver(forName:object:queue:using:) to create your observer, you should call this method or removeObserver(_:) before the system deallocates any object that addObserver(forName:object:queue:using:) specifies.
    ///
    /// If your app targets iOS 9.0 and later or macOS 10.11 and later, and you used addObserver(_:selector:name:object:) to create your observer, you do not need to unregister the observer. If you forget or are unable to remove the observer, the system cleans up the next time it would have posted to it.
    ///
    /// When unregistering an observer, use the most specific detail possible. For example, if you used a name and object to register the observer, use removeObserver(_:name:object:) with the name and object.
    ///
    /// - Parameters:
    ///   - observer: The observer to remove from the dispatch table. Specify an observer to remove only entries for this observer.
    ///   - keyboardNotification: The keyboard notification  to remove from the dispatch table.
    func removeKeyboardNotificationObserver(with selector: Selector, when keyboardNotification: KeyboardNotificationName) {
        NotificationCenter.default.removeKeyboardNotificationObserver(self, when: keyboardNotification)
    }
    
    /// Animate changes to one or more views using the keyboard animation's duration and animation curve.
    ///
    /// - Parameters:
    ///   - notification: A notification containing keyboard animation information, others will be ignored.
    ///   - animations: The specified animation block to the animator.
    ///   - completion: An optional block to execute when the animations finish. This block takes the parameter `finalPosition`, which describes the position where the animations stopped. Use this value to specify whether the animations stopped at their starting point, their end point, or their current position.
    func animate(withKeyboardNotification notification: Notification,
                 animations: @escaping (KeyboardAnimationInfo) -> Void,
                 completion: ((UIViewAnimatingPosition) -> Void)? = nil) {
        UIView.animate(withKeyboardNotification: notification, animations: animations, completion: completion)
    }
}
