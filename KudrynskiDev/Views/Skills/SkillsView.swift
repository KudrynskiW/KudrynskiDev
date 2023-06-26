//
//  SkillsView.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import SwiftUI

struct SkillsView: View {
    struct Constants {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
        static let skillsListFrame = screenHeight * 0.25
        static let skillsListPadding = -16.0
        static let skillsListPaddingTop = -10.0
    }
    
    var skills: [Skill] = try! load("skills.json")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Skills")
                .font(.title2)
            
            List(skills) { skill in
                SkillRowView(skill: skill)
            }
            .listStyle(.inset)
            .padding(.horizontal, Constants.skillsListPadding)
            .frame(height: Constants.skillsListFrame)
            .padding(.top, Constants.skillsListPaddingTop)
        }
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsView()
    }
}
