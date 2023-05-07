# Диаграмма контейнеров
<!-- Окружение системы (роли, участники, внешние системы) и связи системы с ним. Диаграмма контекста C4 и текстовое описание. 
Подробнее: https://confluence.mts.ru/pages/viewpage.action?pageId=375783261
-->
```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

LAYOUT_WITH_LEGEND()


AddElementTag("storage", $shape=RoundedBoxShape(), $bgColor="lightSkyBlue", $fontColor="white")

Person(og, "Org group member", "Орг группа конференции")
Person(s, "Speaker", "Спикер конференции")
Person(p, "Participant", "Участник конференции")

System_Boundary(confApp, "Conference Organization App") {
    
    Container(SPA, "Веб-приложение (SPA)", "", "Веб-версия системы организации конференций")
    Container(mobileApp, "Мобильное приложение", "", "Мобильное приложение организации конференций")

    Container_Boundary(confServ, "Conference API") {
        Container(conference_service, "Conference API", "", "API просмотра и управления конференцией", $tags = "microService")      
        ContainerDb(conference_db, "Conference data", "", "Хранение данных конференции", $tags = "storage")    
    }

    Container_Boundary(sessServ, "Sessions API") {  
        Container(sessions_service, "Sessions API", "", "API работы с сессиями конференций", $tags = "microService")      
        ContainerDb(sessions_db, "Sessions catalog", "", "Хранение выступлений", $tags = "storage")
    }

    Container_Boundary(regServ, "Registration API") {  
        Container(registration_service, "Registration API", "", "API регистрации", $tags = "microService")      
        ContainerDb(registration_db, "Registrations", "", "Регистрация", $tags = "storage")
    }

    ContainerQueue_Ext(message_broker, "Message broker", "", "")
    
}

System_Ext(es, "E-mail system", "The Exchange e-mail system")
System_Ext(mbs, "3rd payment party", "Allows users to pay for conference participation")
System_Ext(css, "3rd party product for conference streaming", "product to organize  conference streaming")

Rel(p, mobileApp, "Uses")
Rel(og, SPA, "Uses")
Rel(s, SPA, "Uses")


Rel(conference_service, conference_db, "чтение/запись", "")
Rel(sessions_service, sessions_db, "чтение/запись", "")
Rel(registration_service, registration_db, "чтение/запись", "")

Rel(SPA, conference_service, "Работа с данными конференции", "")
Rel(SPA, sessions_service, "Работа с докладами конференции", "")
Rel(SPA, registration_service, "Регистрация на конференцию", "")
Rel(mobileApp, registration_service, "Регистрация на конференцию", "")
Rel(mobileApp, conference_service, "Регистрация на конференцию", "")

Rel(confServ, es, "Отправка писем участникам, спикерам и организаторам конференции", "")
Rel(sessServ, es, "Отправка писем спикерам и организаторам конференции", "")
Rel(regServ, es, "Отправка писем участникам", "")
BiRel(regServ, mbs, "Оплата участия в конференции", "")
BiRel(confServ, css, "Онлайн трансляция конференции")

BiRel(confServ, message_broker, "Отправка сообщений о событиях", "")
BiRel(regServ, message_broker, "Отправка сообщений о событиях", "")
BiRel(sessServ, message_broker, "Отправка сообщений о событиях", "")

Lay_Down(sessions_db, es)
Lay_Down(sessions_db, mbs)
Lay_Down(sessions_db, css)
Lay_Down(sessions_db, message_broker)
Lay_Down(message_broker, es)
Lay_Down(message_broker, mbs)
Lay_Down(message_broker, css)

@enduml
```
