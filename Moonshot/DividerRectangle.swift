//
//  DividerRectangle.swift
//  Moonshot
//
//  Created by Maciej Wiącek on 17/09/2023.
//

import SwiftUI

struct DividerRectangle: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct DividerRectangle_Previews: PreviewProvider {
    static var previews: some View {
        DividerRectangle()
    }
}
