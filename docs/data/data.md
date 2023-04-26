# Модель предметной области
<!-- Логическая модель, содержащая бизнес-сущности предметной области, атрибуты и связи между ними. 
Подробнее: https://confluence.mts.ru/pages/viewpage.action?pageId=375782602

Используется диаграмма классов UML. Документация: https://plantuml.com/class-diagram 
-->

```plantuml
@startuml
' Логическая модель данных в варианте UML Class Diagram (альтернатива ER-диаграмме).
namespace Conference {

    Class Conference {
        id : long
        theme : string
        description : string 
        date : date
        conferenceProgram : ConferenceProgram
        conferenceOwner : Employee
        conferenceOrgGroup : OrgGroup
        registrations : ConferenceRegistrations[]
    }

    Class ConferenceProgram {
        id : long
        conferenceThreads : ConferenceThread[]
        responsiblePerson : Employee
    }

    Class ConferenceThread {
        id : long
        theme : string
        description : string 
        responsiblePerson : Employee
        sessionSchedule : SessionsSlots[]
    }

    Class ConferenceSession {
        id : long
        theme : string
        description : string 
        sessionType : SessionType
        sessionSpeaker : ConferenceSpeaker[]
        materialsReviewed : boolean
        materialsApproved : boolean
        reviewer : Employee
        approver : Employee
        materials : ConferenceMaterials[]
        room : string   
        date : date
        startTime : time
        endTime : time
    }

    Class ConferenceMaterials { 
        name : string
        description : string 
        link : string
    }

    Class ConferenceRegistrations {
        id : long
        participant : ConferenceParticipant
        resgistrationType : resgistrationType 
        paid : boolean       
    }

    Class Employee {
        id : long
        firstName : string
        lastName  : string 
        phone : string
        email : string 
        employeeId : long
    }

    Class ConferenceParticipant {
        id : long
        firstName : string
        lastName  : string 
        phone : string
        email : string 
    }

    Class ConferenceSpeaker {
        id : long
        firstName : string
        lastName  : string 
        phone : string
        email : string 
    }

    Class OrgGroup {
        id : long
        organizer : Employee
        hrTeam : Employee[]
        marketingTeam : Employee[]
        orgGroupEmail : string 
    }

    Class ConferenceThread {
        id : long
        theme : string
        description : string 
        Sessions : Session[]
    }

    enum SesstionType {
        presentation
        workshop
        discussion
    }

    enum RegistrationType {
        online
        offline 
    }

    Conference *-- "1..*" ConferenceProgram
    ConferenceProgram *-- "1..*" ConferenceThread
    ConferenceThread *-- "1..*" ConferenceSession
    ConferenceSession -- SesstionType
    ConferenceRegistrations -- RegistrationType
    Conference -- Employee
    Conference -- OrgGroup
    ConferenceProgram -- Employee
    ConferenceThread -- Employee
    ConferenceSession *-- "1..*" ConferenceSpeaker
    ConferenceSession *-- "1..*" ConferenceMaterials
    Conference  *-- "0..*" ConferenceRegistrations
    ConferenceRegistrations -- ConferenceParticipant
    ConferenceSession -- Employee
}


@enduml
```
