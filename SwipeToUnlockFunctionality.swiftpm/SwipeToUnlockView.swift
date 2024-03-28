//
//  SwipeToUnlockView.swift
//  SwipeToUnlockFunctionality
//
//  Created by Vedant Mistry on 29/03/24.
//

import SwiftUI

extension Comparable {
    func clamp<T: Comparable>(lower: T, upper: T) -> T {
        return min(max(self as! T, lower), upper)
    }
}

extension CGSize {
    static var inactiveThumbSize: CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    static var activeThumbSize: CGSize {
        return CGSize(width: 80, height: 50)
    }
    
    static var trackSize: CGSize {
        return CGSize(width: 250, height: 50)
    }
}

extension SwipeToUnlockView {
    func onSwipeSuccess(action: @escaping() -> Void) -> Self {
        var this = self
        this.actionSuccess = action
        
        return this
    }
}

struct SwipeToUnlockView: View {
    @State private var thumbSize: CGSize = CGSize.inactiveThumbSize
    
    @State private var dragOffset: CGSize = .zero
    
    @State private var isSwipedEnough: Bool = false
    
    let trackSize: CGSize = CGSize.trackSize
    
    private var actionSuccess: (() -> Void)?
    
    
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: trackSize.width, height: trackSize.height)
                .foregroundStyle(.regularMaterial)
            
            Text("Swipe to enter")
                .font(.headline)
            
            ZStack {
                Capsule()
                    .frame(width: thumbSize.width, height: thumbSize.height)
                    .foregroundStyle(Color.white)
                    .overlay {
                        Image(systemName: "arrow.right")
                            .fontWeight(.bold)
                    }
            }
            .offset(
                x: getDragOffsetX(),
                y: 0
            )
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.handleDragChanged(value: value)
                    }
                    .onEnded { value in
                        self.handleDragEnded()
                    }
            )
        }
    }
    
    private func getDragOffsetX() -> CGFloat {
        let clampedDragOffsetX = dragOffset.width.clamp(lower: 0, upper: trackSize.width - thumbSize.width)
        return -((trackSize.width / 2) - (thumbSize.width / 2) - clampedDragOffsetX)
    }
    
    private func handleDragChanged(value: DragGesture.Value) {
        self.dragOffset = value.translation
        
        let dragWidth = value.translation.width
        let targetDragWidth = self.trackSize.width - (self.thumbSize.width * 2)
        let wasInitiated = dragWidth > 2
        let didReachTarget = dragWidth > targetDragWidth
        
        self.thumbSize = wasInitiated ? CGSize.activeThumbSize : CGSize.inactiveThumbSize
        
        if didReachTarget {
            self.isSwipedEnough = true
        } else {
            self.isSwipedEnough = false
        }
        
    }
    
    private func handleDragEnded() {
        withAnimation(Animation.spring) {
            if self.isSwipedEnough {
                self.dragOffset = CGSize(
                    width: self.trackSize.width - self.thumbSize.width,
                    height: 0
                )
                
                if nil != self.actionSuccess {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.actionSuccess!()
                    }
                }
            } else {
                self.dragOffset = .zero
                self.thumbSize = CGSize.inactiveThumbSize
            }
        }
    }
}

#Preview {
    SwipeToUnlockView()
}
