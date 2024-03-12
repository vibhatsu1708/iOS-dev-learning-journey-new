//
//  Home.swift
//  CustomSwipeActionsInScrollView
//
//  Created by Vedant Mistry on 12/03/24.
//

import SwiftUI

struct Home: View {
    @State private var colors: [Color] = [.black, .orange, .green, .blue, .indigo]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(colors, id: \.self) { color in
                    SwipeAction(
                        cornerRadius: 15,
                        // direction of the swipe action is decided if the element in the colors array is .black
                        direction: color == .black ? .trailing : .leading) {
                            CardView(color)
                        } actions: {
                            Action(tint: .indigo, icon: "bookmark.fill") {
                                print("Bookmarked")
                            }
                            
                            // basically this action will be enabled if and only if the colors in the array has the color .black, or else will be disabled
                            Action(tint: .red, icon: "trash.fill", isEnabled: color == .black) {
                                withAnimation(.easeInOut) {
                                    colors.removeAll(where: { $0 == color })
                                }
                            }
                        }

                }
            }
        }
        .padding()
        .scrollIndicators(.hidden)
    }
    
    // Sample card view
    @ViewBuilder
    func CardView(_ color: Color) -> some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 5.0)
                .frame(width: 50, height: 50, alignment: .center)
            
            VStack(alignment: .leading, spacing: 5) {
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: 100, height: 5)
                
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: 60, height: 5)
            }
            
            Spacer()
        }
        .foregroundStyle(Color.white.opacity(0.4))
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(color/*, in: .rect(cornerRadius: 15)*/)
    }
}

// Custom Swipe action
struct SwipeAction<Content: View>: View {
    var cornerRadius: CGFloat = 0
    var direction: SwipeDirection = .trailing
    @ViewBuilder var content: Content
    @ActionBuilder var actions: [Action]
    
    // View Properties
    @Environment(\.colorScheme) private var colorScheme
    
    // View Unique ID
    let viewID = UUID()
    
    @State private var isEnabled: Bool = true
    @State private var scrollOffset: CGFloat = .zero
    
    var body: some View {
        if #available(iOS 17.0, *) {
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        content
                            .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
                            .containerRelativeFrame(.horizontal)
                            .background(colorScheme == .dark ? .black : .white)
                            .background {
                                if let firstAction  = filteredActions.first {
                                    Rectangle()
                                        .fill(firstAction.tint)
                                        .opacity(scrollOffset == .zero ? 0 : 1)
                                }
                            }
                            .id(viewID)
                            .transition(.identity)
                            .overlay {
                                GeometryReader {
                                    let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                                    Color.clear
                                        .preference(key: OffsetKey.self, value: minX)
                                        .onPreferenceChange(OffsetKey.self) {
                                            scrollOffset = $0
                                        }
                                }
                            }
                        
                        ActionButtons {
                            withAnimation(.snappy) {
                                scrollProxy.scrollTo(viewID, anchor: direction == .trailing ? .topLeading : .topTrailing)
                            }
                        }
                        .opacity(scrollOffset == .zero ? 0 : 1)
                    }
                    .scrollTargetLayout()
                    .visualEffect { content, geometryProxy in
                        content
                            .offset(x: scrollOffset(geometryProxy))
                    }
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                .background {
                    if let lastAction = filteredActions.last {
                        Rectangle()
                            .fill(lastAction.tint)
                            .opacity(scrollOffset == .zero ? 0 : 1)
                    }
                }
                .clipShape(.rect(cornerRadius: cornerRadius))
                .rotationEffect(.init(degrees: direction == .leading ? 180 : 0))
            }
            .allowsHitTesting(isEnabled)
            .transition(CustomTransition())
        } else {
            // Fallback on earlier versions
        }
    }
    
    // Action Buttons
    @ViewBuilder
    func ActionButtons(resetPosition: @escaping () -> ()) -> some View {
        // Each button will have a width of 100
        Rectangle()
            .fill(.clear)
            .frame(width: CGFloat(filteredActions.count) * 100)
            .overlay(alignment: direction.alignment) {
                HStack(spacing: 0) {
                    ForEach(filteredActions) { button in
                        Button {
                            Task {
                                isEnabled = false
                                resetPosition()
                                try? await Task.sleep(for: .seconds(0.25))
                                button.action()
                                try? await Task.sleep(for: .seconds(0.1))
                                isEnabled = true
                            }
                        } label: {
                            Image(systemName: button.icon)
                                .font(button.iconFont)
                                .foregroundStyle(button.iconTint)
                                .frame(width: 100)
                                .frame(maxHeight: .infinity)
                                .contentShape(.rect)
                        }
                        .buttonStyle(.plain)
                        .background(button.tint)
                        .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
                    }
                }
            }
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        if #available(iOS 17.0, *) {
            let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
            return (minX > 0 ? -minX : 0)
        } else {
            // Fallback on earlier versions
        }
        
        return 0.0
    }
    
    var filteredActions: [Action] {
        return actions.filter({ $0.isEnabled })
    }
}

// Offset Key
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Custom Transition
struct CustomTransition: Transition {
    @available(iOS 17.0, *)
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .mask {
                GeometryReader {
                    let size = $0.size
                    
                    Rectangle()
                        .offset(y: phase == .identity ? 0 : -size.height)
                }
                .containerRelativeFrame(.horizontal)
            }
    }
}

// Swipe direction
enum SwipeDirection {
    case leading
    case trailing
    
    var alignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}

// Action Model, more can be added
struct Action: Identifiable {
    private(set) var id: UUID = .init()
    var tint: Color
    var icon: String
    var iconFont: Font = .title
    var iconTint: Color = .white
    var isEnabled: Bool = true
    var action: () -> ()
}

@resultBuilder
struct ActionBuilder {
    static func buildBlock(_ components: Action...) -> [Action] {
        return components
    }
}

#Preview {
    Home()
}
