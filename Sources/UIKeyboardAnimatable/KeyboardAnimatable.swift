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
import ObjectAssociation

@objc public protocol KeyboardAnimatable {
    
    typealias AnimationClosure = (KeyboardAnimationInfo) -> Void
    
    typealias Completion = ((UIViewAnimatingPosition) -> Void)
    
    @objc func keyboardHandler(_ notification: Notification)
}

public struct KeyboardAnimation {
    let animation: KeyboardAnimatable.AnimationClosure
    let completion: KeyboardAnimatable.Completion?
}

public final class KeyboardAnimationStore: NSObject {
    
    private var store: [KeyboardNotificationName: KeyboardAnimation] = [:]
    
    subscript(notification: KeyboardNotificationName) -> KeyboardAnimation? {
        get { store[notification] }
        set { store[notification] = newValue }
    }
    
}

public protocol KeyboardAnimationStorable: NSObject {
    var keyboardAnimationStore: KeyboardAnimationStore? { get set}
}

extension UIViewController: KeyboardAnimationStorable {
    private static var keyboardAnimationStore = ObjectAssociation<KeyboardAnimationStore>()
    
    public var keyboardAnimationStore: KeyboardAnimationStore? {
        get { Self.keyboardAnimationStore[self] }
        set { Self.keyboardAnimationStore[self] = newValue }
    }
    
    @objc public func keyboardHandler(_ notification: Notification) {
        guard
            let keyboardNotificationName = KeyboardNotificationName(rawValue: notification.name),
            let keyboardAnimation = keyboardAnimationStore?[keyboardNotificationName]
        else {
            return
        }
        
        UIView.animate(
            withKeyboardNotification: notification,
            animations: keyboardAnimation.animation,
            completion: keyboardAnimation.completion
        )
    }
}


extension UIView: KeyboardAnimationStorable {
    private static var keyboardAnimationStore = ObjectAssociation<KeyboardAnimationStore>()
    
    public var keyboardAnimationStore: KeyboardAnimationStore? {
        get { Self.keyboardAnimationStore[self] }
        set { Self.keyboardAnimationStore[self] = newValue }
    }
    
    @objc public func keyboardHandler(_ notification: Notification) {
        guard
            let keyboardNotificationName = KeyboardNotificationName(rawValue: notification.name),
            let keyboardAnimation = keyboardAnimationStore?[keyboardNotificationName]
        else {
            return
        }
        
        UIView.animate(
            withKeyboardNotification: notification,
            animations: keyboardAnimation.animation,
            completion: keyboardAnimation.completion
        )
    }
}

public extension KeyboardAnimatable where Self: KeyboardAnimationStorable {
    
    func animateWithKeyboard(when notificationNames: [KeyboardNotificationName],
                                    animations: @escaping AnimationClosure,
                                    completion: Completion? = nil) {
        
        let store = keyboardAnimationStore ?? KeyboardAnimationStore()
        
        notificationNames.forEach { notificationName in
            
            let animation = KeyboardAnimation(
                animation: animations,
                completion: completion
            )
            
            store[notificationName] = animation
            
            NotificationCenter.default.addKeyboardNotificationObserver(
                self,
                selector: #selector(keyboardHandler(_:)),
                when: notificationName
            )
        }
        
        keyboardAnimationStore = store
    }
    
    func removeKeyboardAnimations(when notificationNames: [KeyboardNotificationName]) {
        notificationNames.forEach { notificationName in
            NotificationCenter.default.removeKeyboardNotificationObserver(self, when: notificationName)
        }
    }
    
}
