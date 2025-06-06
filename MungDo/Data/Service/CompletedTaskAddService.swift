//
//  CompletedTaskAddService.swift
//  MungDo
//
//  Created by Zhen on 6/4/25.
//

import Foundation
import Combine

//완료되었을 때 (완료 버튼 누르면) 호출
final class CompletedTaskAddService: ObservableObject {
    
    //실제로 저장되는 값
    var taskDisplayName: String = ""
    var taskDoneDate: Date = Date()
    
    var isSaving: Bool = false
    var saveErrorMessage: String? = nil
    var saveSuccess: Bool = false
    
    func saveTaskToDb(num: Int){
        self.isSaving = true
        self.saveErrorMessage = nil
        self.saveSuccess = false
        
        
        FirestoreService.shared.addTask(num: num, taskDisplayName: taskDisplayName, taskDoneDate: taskDoneDate){
            [weak self] error in
            self?.isSaving = false
            if let error = error {
                self?.saveErrorMessage = error.localizedDescription
            } else {
                self?.saveSuccess = true
            }
        }
        
    }
    
}

