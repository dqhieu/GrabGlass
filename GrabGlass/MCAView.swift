//
//  MCAView.swift
//  GrabGlass
//
//  Created by Hieu Dinh on 6/18/25.
//

import SwiftUI

struct MCAView: View {
  @Environment(\.tabViewBottomAccessoryPlacement) var placement

  var body: some View {
    HStack(alignment: .center) {
      AsyncImage(url: URL(string: "https://photon-s3.grab.com/redbull/beta/Premium.png")) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
//          .frame(width: 48, height: 48)
      } placeholder: {
        ProgressView()
      }

      VStack(alignment: .leading) {
        Text("You are on the way")
          .font(.caption)
        Text("Lobby, Grab One North")
          .font(.caption)
          .foregroundStyle(.secondary)
      }
      Spacer()
      if placement != .inline {
        VStack(alignment: .trailing) {
          Text("5:32 PM")
            .font(.caption)
          Text("7 mins left")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
      }
    }
    .padding(.horizontal)
  }
}
