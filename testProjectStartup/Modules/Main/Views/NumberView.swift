//
//  NumberView.swift
//  testProjectStartup
//
//  Created by Enzhe Gaysina on 03.03.2024.
//

import SwiftUI

struct NumberView: View {
    @State private var scale: CGFloat = 1.0
    ///Flag indicating whether a number was pressed
    @State private var isPressed = false
    @Binding var number: Int
    var updateRandomNumber: () -> Void
    
    var body: some View {
	   Text("\(number)")
		  .font(.system(size: Constants.fontSize,
					 weight: .regular,
					 design: .rounded)
		  )
		  .gesture(gesture)
		  .frame(width: Constants.frameSize,
			    height: Constants.frameSize
		  )
		  .background(
			 RoundedRectangle(cornerRadius: Constants.cornerRadius)
				.stroke(Color.purple,
					   lineWidth: Constants.strokeWidth
					  )
				.background(RoundedRectangle(cornerRadius: Constants.cornerRadius)
				    .fill(Color.blue.opacity(Constants.backgroundOpacity)))
		  )
		  .scaleEffect(scale)
		  .padding(Constants.padding)
    }
    
    var gesture: some Gesture {
	   DragGesture(minimumDistance: .zero)
		  .onChanged { _ in
			 withAnimation {
				self.isPressed = true
				self.scale = Constants.scaleOnPress
			 }
		  }
		  .onEnded { _ in
			 withAnimation {
				self.isPressed = false
				self.scale = Constants.scaleOffPress
			 }
			 self.updateRandomNumber()
		  }
    }
}

// MARK: - Constants

fileprivate extension NumberView {
    enum Constants {
	   static let fontSize: CGFloat = 15
	   static let frameSize: CGFloat = 40
	   static let strokeWidth: CGFloat = 2
	   static let cornerRadius: CGFloat = 12
	   static let backgroundOpacity: Double = 0.1
	   static let scaleOnPress: CGFloat = 0.8
	   static let padding: CGFloat = 5
	   static let scaleOffPress: CGFloat = 1.0
    }
}
