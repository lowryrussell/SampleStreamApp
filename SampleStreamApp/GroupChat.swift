//
//  GroupChat.swift
//  SampleStreamApp
//
//  Created by Russell Lowry on 1/9/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct GroupChat: View {
    @Injected(\.chatClient) var chatClient
    
    var body: some View {
        ChatChannelView(
            viewFactory: DefaultViewFactory.shared,
            channelController: chatClient.channelController(for: try! ChannelId(cid: "messaging:1_64990eff-e3e0-4fcd-8079-deaf86d05d02"))
        )
    }
}

#Preview {
    GroupChat()
}
