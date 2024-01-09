//
//  SampleStreamAppApp.swift
//  SampleStreamApp
//
//  Created by Russell Lowry on 1/9/24.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

@main
struct SampleStreamAppApp: App {
    @State var streamChat: StreamChat?
    
    let utils = Utils(messageListConfig: MessageListConfig(handleTabBarVisibility: false))
    
    var chatClient: ChatClient = {
        //For the tutorial we use a hard coded api key and application group identifier
        var config = ChatClientConfig(apiKey: .init("API_KEY"))
        config.isLocalStorageEnabled = true

        // The resulting config is passed into a new `ChatClient` instance.
        let client = ChatClient(config: config)
        return client
    }()
    
    init() {
        streamChat = StreamChat(chatClient: chatClient, utils: utils)
        connectUser()
    }
    
    private func connectUser() {
        chatClient.connectUser(userInfo: .init(id: "john-doe"), token: "TOKEN")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
