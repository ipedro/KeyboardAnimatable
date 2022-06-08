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

public typealias KeyboardAnimationInfo = (duration: TimeInterval, keyboardFrame: CGRect, curve: UIView.AnimationCurve)

@objc public protocol KeyboardAnimatable {
    
    typealias Animations = ((KeyboardAnimationInfo) -> Void)
    
    typealias Completion = ((UIViewAnimatingPosition) -> Void)
}

// MARK: - KeyboardAnimationStorable Extension

public extension KeyboardAnimatable {
    
    private var notificationCenter: NotificationCenter { NotificationCenter.default }
    
    func animateWhenKeyboard(_ notificationName: KeyboardNotificationName,
                             animations: @escaping Animations,
                             completion: Completion? = nil) {
        
        notificationCenter.addObserver(
            forName: notificationName.rawValue,
            object: .none,
            queue: .main
        ) { notification in
            let keyboardAnimation = KeyboardAnimation(
                animation: animations,
                completion: completion
            )
            
            UIView.animate(
                withKeyboardNotification: notification,
                animations: keyboardAnimation.animation,
                completion: keyboardAnimation.completion
            )
        }
    }
    
    func stopAnimatingWhenKeyboard(_ notificationNames: KeyboardNotificationName...) {
        notificationNames.forEach { notificationName in
            notificationCenter.removeObserver(self, name: notificationName.rawValue, object: nil)
        }
    }
}
