//
//  TaskListItemView.swift
//  MungDo
//
//  Created by cheshire on 6/4/25.
//

import SwiftUI

// 태스크 리스트 아이템 뷰
struct TaskListItemView: View {
    let taskItem: TaskItem
    let onToggleComplete: (TaskItem) -> Void

    var body: some View {
        HStack(spacing: 16) {
            // 아이콘
            ZStack {
                Circle()
                    .fill(Color("Secondary03"))
                    .frame(width: 50, height: 50)

                taskItem.taskType.displayIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }

            // 제목
            VStack(alignment: .leading, spacing: 2) {
                Text(taskItem.taskType.displayName)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
            }

            Spacer()

            // 완료 체크박스
            Button(action: {
                onToggleComplete(taskItem)
            }) {
                ZStack {
                    Circle()
                        .stroke(taskItem.isCompleted ? Color.green : Color.gray.opacity(0.5), lineWidth: 2)
                        .frame(width: 24, height: 24)

                    if taskItem.isCompleted {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .font(.system(size: 14, weight: .bold))
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    TaskListItemView(
        taskItem: TaskItem(taskType: .walk, date: Date(), isCompleted: false),
        onToggleComplete: { _ in }
    )
    .padding()
}
