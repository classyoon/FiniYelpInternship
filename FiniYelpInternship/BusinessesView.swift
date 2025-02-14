//
//  BusinessesView.swift
//  FiniYelpInternship
//
//  Created by Conner Yoon on 2/14/25.
//

import SwiftUI

struct BusinessesView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0){
                BusinessCardView()
                BusinessCardView()
                BusinessCardView()
            }
        }
    }
}

#Preview {
    BusinessesView()
}
