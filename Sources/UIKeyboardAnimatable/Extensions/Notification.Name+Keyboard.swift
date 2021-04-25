//
//  Notification.Name+Keyboard.swift
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

public extension Notification.Name {
    
    /// Posted immediately prior to the display of the keyboard.
    ///
    /// The notification `keyboardAnimationInfo` contains information about the keyboard's location, size, and animations.
    static let keyboardWillShow: Notification.Name = UIResponder.keyboardWillShowNotification
    
    /// Posted immediately after the display of the keyboard.
    ///
    /// The notification `keyboardAnimationInfo` contains information about the keyboard's location, size, and animations.
    static let keyboardDidShow: Notification.Name = UIResponder.keyboardDidShowNotification
    
    /// Posted immediately prior to the dismissal of the keyboard.
    ///
    /// The notification `keyboardAnimationInfo` contains information about the keyboard's location, size, and animations.
    static let keyboardWillHide: Notification.Name = UIResponder.keyboardWillHideNotification
    
    /// Posted immediately after the dismissal of the keyboard.
    ///
    /// The notification `keyboardAnimationInfo` contains information about the keyboard's location, size, and animations.
    static let keyboardDidHide: Notification.Name = UIResponder.keyboardDidHideNotification
    
    /// Posted immediately prior to a change in the keyboard’s frame.
    ///
    /// The notification `keyboardAnimationInfo` contains information about the keyboard's location, size, and animations.
    static let keyboardWillChangeFrame: Notification.Name = UIResponder.keyboardWillChangeFrameNotification
    
    /// Posted immediately after a change in the keyboard’s frame.
    ///
    /// The notification `keyboardAnimationInfo` contains information about the keyboard's location, size, and animations.
    static let keyboardDidChangeFrame: Notification.Name = UIResponder.keyboardDidChangeFrameNotification
    
}
