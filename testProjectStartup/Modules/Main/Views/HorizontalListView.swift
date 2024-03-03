//
//  HorizontalListView.swift
//  testProjectStartup
//
//  Created by Enzhe Gaysina on 03.03.2024.
//

import SwiftUI

struct HorizontalListView: View {
    @Binding var numbers: [Int]
    
    @State private var isDragging = false
    
    var body: some View {
	   ScrollView(.horizontal, showsIndicators: false) {
		  HStack(spacing: Constants.horizontalSpacing) {
			 ForEach(numbers.indices, id: \.self) { index in
				NumberView(number: $numbers[index]) {
				    updateRandomNumber(inListAtIndex: index)
				}
			 }
		  }
		  .padding(Constants.horizontalPadding)
	   }
    }
    ///possible logic for updating numbers
    func updateRandomNumber(inListAtIndex index: Int) {}
}
// MARK: - Constants
fileprivate extension HorizontalListView {
    enum Constants {
	   static let horizontalSpacing: CGFloat = 10.0
	   static let horizontalPadding: CGFloat = 5.0
    }
}
