//
//  NotificationCenter+Convenience.swift
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

import Foundation

public extension NotificationCenter {
    
    /// Adds an entry to the notification center to call the provided selector with the notification.
    ///
    /// Unregister an observer to stop receiving notifications.
    ///
    /// To unregister an observer, use removeObserver(_:) or removeObserver(_:name:object:) with the most specific detail possible. For example, if you used a name and object to register the observer, use the name and object to remove it.
    ///
    /// If your app targets iOS 9.0 and later or macOS 10.11 and later, you do not need to unregister an observer that you created with this function. If you forget or are unable to remove an observer, the system cleans up the next time it would have posted to it.
    ///
    /// - Parameters:
    ///   - observer: An object to register as an observer.
    ///   - aSelector: A selector that specifies the message the receiver sends observer to alert it to the notification posting. The method that aSelector specifies must have one and only one argument (an instance of NSNotification).
    ///   - keyboardNotification: The keyboard notification to register for delivery to the observer.
    func addKeyboardNotificationObserver(_ observer: Any, selector aSelector: Selector, for keyboardNotification: KeyboardNotificationName) {
        addObserver(observer, selector: aSelector, name: keyboardNotification.notificationName, object: nil)
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
    func removeKeyboardNotificationObserver(_ observer: Any, for keyboardNotification: KeyboardNotificationName) {
        removeObserver(observer, name: keyboardNotification.notificationName, object: nil)
    }
    
}
