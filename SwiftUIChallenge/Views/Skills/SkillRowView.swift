//
//  SkillRowView.swift
//  SwiftUIChallenge
//
//  Created by Wojciech Kudrynski on 21/06/2023.
//

import SwiftUI

struct SkillRowView: View {
    var skill: Skill
    @State var skillImages: [String] = [
        "star",
        "star",
        "star",
        "star",
        "star"
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(skill.name)
                    .font(.subheadline)
                Spacer()
                HStack {
                    ForEach(0..<5) { idx in
                        Image(systemName: skillImages[idx])
                    }
                }
            }.foregroundColor(.secondary)
        }.onAppear {
            skillImages = skill.prepareImages()
        }
    }
}

struct SkillRow_Previews: PreviewProvider {
    static var previews: some View {
        SkillRowView(skill: Skill(id: 0, name: "test", category: "test", rate: 5))
    }
}
