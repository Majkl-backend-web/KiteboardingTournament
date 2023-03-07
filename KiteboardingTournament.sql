
create table Kitecourse(
   Id int not null primary key ,
   KitecourseType char not null,
   Duration int  not null,
   Price int not null
   );
  
create table Person(
   Id int not null primary key,
   Firstname varchar (15) not null,
   Lastname varchar (15) not null,
   Email varchar (30) not null,
   Kitecourse int not null,
   Iban varchar (30) 
   );   
      
   
create table Teacher( 
   Id int not null primary key,
   Person int not null,
   ContractDuration int not null
   );

create table Student( 
   Id int not null primary key, 
   Person int not null,
   ContractNumber varchar(20)not null
   );
 
create table Kitegroup(
   Id int not null primary key ,
   Kitecourse int not null,
   Teacher int not null,
   NumberOfStudents int not null,
   Startdate datetime
   );

create table Kitemember(
   Kitegroup int not null,
   Student int not null
   );



alter table Person add foreign key (Kitecourse) references Kitecourse(Id);
alter table Teacher add foreign key (Person) references Person(Id);

alter table Student add foreign key (Person) references Person(Id);

alter table Kitegroup add foreign key (Kitecourse) references Kitecourse(Id);
alter table Kitegroup add foreign key (Teacher) references Teacher(Id);

alter table Kitemember add foreign key (Student) references Student(Id);
alter table Kitemember add foreign key (Kitegroup) references Kitegroup(Id);

insert into Kitecourse(Id, KitecourseType, Duration, Price)
values (1, 'Beginner', 12, 500);