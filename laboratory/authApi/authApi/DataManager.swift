
import Foundation
import Firebase


class DataManajer:ObservableObject{
    @Published var jobs:[Jobs] = []
    
    init(){
        fetchJobs() 
    }
    
    
    func fetchJobs(){
        jobs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("jobs")
        ref.getDocuments{ snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot{
                for document in snapshot.documents{
                    let data = document.data()
                    let id = data["id"] as? String ?? ""
                    let companyName = data["companyName"] as? String ?? ""
                    let employmentType = data["employmentType"] as? String ?? ""
                    let experiences = data["experiences"] as? Int ?? -1
                    let industryOfCompany = data["industryOfCompany"] as? String ?? ""
                    let jobName = data["jobName"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let photo = data["photo"] as? String ?? ""
                    let salary = data["salary"] as? Int ?? -1
                    let about = data["about"] as? String ?? ""
                    let skills = data["skills"] as? [String] ?? [""]
                    
                    let job = Jobs(id: id, companyName: companyName, employmentType: employmentType, experiences: experiences, industryOfCompany: industryOfCompany, jobName: jobName, location: location, photo: photo, salary: salary, about: about, skills: skills)
                    self.jobs.append(job)
                    self.jobs.append(job)
                    self.jobs.append(job)
                    self.jobs.append(job)
                    self.jobs.append(job)
                    self.jobs.append(job)
                    self.jobs.append(job)
                    self.jobs.append(job)
                   
                }
            }
        }
    }
    
    
}
