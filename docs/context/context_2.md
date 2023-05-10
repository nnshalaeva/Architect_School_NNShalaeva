# Диаграмма ограниченных контекстов
<!-- Окружение системы (роли, участники, внешние системы) и связи системы с ним. Диаграмма контекста C4 и текстовое описание. 
Подробнее: https://confluence.mts.ru/pages/viewpage.action?pageId=375783261
-->
```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

LAYOUT_WITH_LEGEND()

Person(og, "Org group member", "A conference organization group member")
Person(s, "Speaker", "A conference Speaker")
Person(p, "Participant", "A conference participant")
Container_Boundary(confApp, "Conference Organization App", "Allows to organize conference") {
    Container(front, "Front App")
    Container(sessions, "Sessions API")
    Container(conference, "Conference App")
    Container(registration, "Registration App")
}
Container_Boundary(ext, "Conference Organization App Expernal Systems", "helps to organize conference") {

System_Ext(es, "E-mail system", "The internal Microsoft Exchange e-mail system.")
System_Ext(mbs, "3rd payment party", "Allows users to pay for conference participation")
System_Ext(css, "3rd party product for conference streaming", "product to organize  conference streaming")
}

Rel(og, front, "Uses")
Rel(p, front, "Uses")
Rel(s, front, "Uses")
Rel(sessions, es, "Sends e-mails using", "SMTP")
Rel(registration, es, "Sends e-mails using", "SMTP")
Rel(conference, es, "Sends e-mails using", "SMTP")
BiRel(registration, mbs, "Uses")
BiRel(conference, css, "integrates")
Rel(front, sessions, "Uses")
Rel(front, conference, "Uses")
Rel(front, registration, "Uses")
@enduml
```
