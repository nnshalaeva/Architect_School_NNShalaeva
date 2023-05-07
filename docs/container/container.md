# Контекстная диаграмма
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
System(confApp, "Conference Organization App", "Allows to organize conference")
System_Ext(es, "E-mail system", "The internal Microsoft Exchange e-mail system.")
System_Ext(mbs, "3rd payment party", "Allows users to pay for conference participation")
System_Ext(css, "3rd party product for conference streaming", "product to organize  conference streaming")

Rel(og, confApp, "Uses")
Rel(p, confApp, "Uses")
Rel(s, confApp, "Uses")
Rel(confApp, es, "Sends e-mails", "SMTP")
Rel(confApp, mbs, "Uses")
Rel(confApp, css, "integrates")
@enduml
```
