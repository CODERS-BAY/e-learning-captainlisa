# E-Learning

The data structure of a new e-learning system is to be implemented. Draw the following facts in an ER diagram in Chen notation and create a relational model No null values are allowed.
An e-course is clearly identified by a course number (LVANR). In addition, a designation (NAME) is stored, a maximum number of participants (MAXIMUM) and the amount of time (SIZE) required to complete the course. It is noted which e-courses are a prerequisite for which other e-courses.
Learning modules have a name (NAME) and a unique identification number (ID). Courses are assigned several learning modules (at least one). Learning modules can be used for several courses. For each course the sequence (ORDER) of modules is noted.
Each learning module contains several learning objects (e.g. pictures, texts, videos). Learning objects are uniquely identified by the module to which they are assigned and their name (NAME). The type (TYPE) is also stored for learning objects.
In some cases, an e-course may also be assigned a test module (maximum). A mode (MODE) of a test module is known and a unique name (DEFINITION) - a test module can be assigned to several e-courses. MC tests, fees and external exams are exam modules. For each submission a deadline (DEADLINE) is also known. A time (TIME) is known for each MC test. An MC test consists of several questions. Questions are clearly identified by an identification number (FRAGEID). For this purpose, the text (QUESTION), one correct (AW TRUE) and two incorrect answers (AW FALSE1, AW FALSE2) must be stored, whereby a question can occur in several different MC tests.
Persons are uniquely identified by a personal number (PNR). The name (NAME) is also stored. Persons can participate in any number of courses. An e-course, is moderated by at least one and at most two persons, whereby one person can moderate a maximum of four courses.

## ER-Model:

![ER-Model](erm-elearn.jpeg)

## Textual Presentation:

**primary key** 
_foreign key_

* e-course (**LVA-NR:int**, name:varchar(32), duration:int, maxNumbOfParticipants:int, numOfTrainers:int)
* learning module (**moduleID:int**, name:varchar(32))
* learning object (**moduleID:int**, **name.varchar(32)**, type:varchar(32))
* curriculum (**_moduleID:int_**, **_LVA-NR:int_**, order:int)
* test module (**definition:varchar(32)**, _LVA-NR:int_, mode:varchar(32))
* exam module (**ID:int**, _LVA-NR:int_, deadline:timestamp, time:int, type:varchar(32))
* question (**ID:int**, question:varchar(32), AWTrue:varchar(32), AWFalse1:varchar(32), AWFalse2:varchar(32))
* person (**PNR:int**, name:varchar(32), e-mail:varchar(32), password:varchar(32), isTrainer:boolean)

## Relational Model

E-course:
| LVA-Nr. | name | duration | maxNumOfParticipants | numOfTrainers |
| -------|---|----|----|---|
|1234|Coding| 5 | 10 |2

Person:
| PNR | name | e-mail | password | isTrainer|
|----|----|----|----|----|
|234|Lisa|my@email.com|password|false|

Learning module:
|module-ID| name|
|--|---|
|458|Web|

Learning object:
|module-ID| name| type|
|---|---|---|
458|cheatsheet|docx|

Curriculum:
|module-ID|LVA-Nr.|order|
|--|--|--|
|458|1234|4|

Test module:
|definition|LVA-Nr.|mode|
|--|--|--|
|testA|1234|modeA|

Exam module:
|exam-ID|LVA-Nr.|deadline|time|type|
|--|--|--|--|--|
|666|1234|YYYY-MM-DD hh:mm:ss|hh:mm:ss|Multiple Choice Exam

Question:
|question-ID|question|AWTrue|AWFalse1|AWFalse2|
|--|--|--|--|--|
|534|Is this a question?|Yes|No|Definitely not|

