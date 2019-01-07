/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2019/1/7 14:32:50                            */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Users') and o.name = 'FK_USERS_REFERENCE_USERTYPE')
alter table Users
   drop constraint FK_USERS_REFERENCE_USERTYPE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Users') and o.name = 'FK_USERS_REFERENCE_CARD')
alter table Users
   drop constraint FK_USERS_REFERENCE_CARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('charge_log') and o.name = 'FK_CHARGE_L_REFERENCE_CARD')
alter table charge_log
   drop constraint FK_CHARGE_L_REFERENCE_CARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('charge_log') and o.name = 'FK_CHARGE_L_REFERENCE_MACHINE')
alter table charge_log
   drop constraint FK_CHARGE_L_REFERENCE_MACHINE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('charge_log') and o.name = 'FK_CHARGE_L_REFERENCE_USERS')
alter table charge_log
   drop constraint FK_CHARGE_L_REFERENCE_USERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('consume_log') and o.name = 'FK_CONSUME__REFERENCE_CARD')
alter table consume_log
   drop constraint FK_CONSUME__REFERENCE_CARD
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('consume_log') and o.name = 'FK_CONSUME__REFERENCE_USERS')
alter table consume_log
   drop constraint FK_CONSUME__REFERENCE_USERS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Card')
            and   type = 'U')
   drop table Card
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Machine')
            and   type = 'U')
   drop table Machine
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Unit')
            and   type = 'U')
   drop table Unit
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Users')
            and   type = 'U')
   drop table Users
go

if exists (select 1
            from  sysobjects
           where  id = object_id('charge_log')
            and   type = 'U')
   drop table charge_log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('consume_log')
            and   type = 'U')
   drop table consume_log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('schedule')
            and   type = 'U')
   drop table schedule
go

if exists (select 1
            from  sysobjects
           where  id = object_id('stuff')
            and   type = 'U')
   drop table stuff
go

if exists (select 1
            from  sysobjects
           where  id = object_id('usertype')
            and   type = 'U')
   drop table usertype
go

/*==============================================================*/
/* Table: Card                                                  */
/*==============================================================*/
create table Card (
   id                   numeric              identity,
   state                varchar(254)         null,
   amount               float                null,
   limit                float                null,
   constraint PK_CARD primary key (id)
)
go

/*==============================================================*/
/* Table: Machine                                               */
/*==============================================================*/
create table Machine (
   id                   numeric              identity,
   did                  numeric              not null,
   addr                 varchar(254)         null,
   constraint PK_MACHINE primary key (id)
)
go

/*==============================================================*/
/* Table: Unit                                                  */
/*==============================================================*/
create table Unit (
   id                   numeric              identity,
   type                 varchar(254)         null,
   account              varchar(254)         null,
   password             varchar(254)         null,
   pnum                 varchar(254)         null,
   constraint PK_UNIT primary key (id)
)
go

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users (
   id                   numeric              not null,
   Car_id               numeric              null,
   name                 varchar(254)         not null,
   password             varchar(254)         not null,
   usertype             varchar(254)         null,
   type                 int                  not null,
   constraint PK_USERS primary key (id)
)
go

/*==============================================================*/
/* Table: charge_log                                            */
/*==============================================================*/
create table charge_log (
   id                   numeric              not null,
   Car_id               numeric              null,
   Use_id               numeric              null,
   Mac_id               numeric              null,
   amount               float                null,
   time                 datetime             null,
   result               int                  null,
   reason               varchar(254)         null,
   constraint PK_CHARGE_LOG primary key (id)
)
go

/*==============================================================*/
/* Table: consume_log                                           */
/*==============================================================*/
create table consume_log (
   id                   numeric              not null,
   Car_id               numeric              null,
   Use_id               numeric              null,
   amount               float                null,
   time                 datetime             null,
   result               int                  null,
   reason               varchar(254)         null,
   constraint PK_CONSUME_LOG primary key (id)
)
go

/*==============================================================*/
/* Table: schedule                                              */
/*==============================================================*/
create table schedule (
   id                   numeric              identity,
   "begin"              datetime             null,
   "end"                datetime             null,
   address              varchar(254)         null,
   constraint PK_SCHEDULE primary key (id)
)
go

/*==============================================================*/
/* Table: stuff                                                 */
/*==============================================================*/
create table stuff (
   id                   numeric              identity,
   name                 varchar(254)         null,
   sid                  varchar(254)         null,
   did                  varchar(254)         null,
   constraint PK_STUFF primary key (id)
)
go

/*==============================================================*/
/* Table: usertype                                              */
/*==============================================================*/
create table usertype (
   usertype             varchar(254)         not null,
   constraint PK_USERTYPE primary key (usertype)
)
go

alter table Users
   add constraint FK_USERS_REFERENCE_USERTYPE foreign key (usertype)
      references usertype (usertype)
go

alter table Users
   add constraint FK_USERS_REFERENCE_CARD foreign key (Car_id)
      references Card (id)
go

alter table charge_log
   add constraint FK_CHARGE_L_REFERENCE_CARD foreign key (Car_id)
      references Card (id)
go

alter table charge_log
   add constraint FK_CHARGE_L_REFERENCE_MACHINE foreign key (Mac_id)
      references Machine (id)
go

alter table charge_log
   add constraint FK_CHARGE_L_REFERENCE_USERS foreign key (Use_id)
      references Users (id)
go

alter table consume_log
   add constraint FK_CONSUME__REFERENCE_CARD foreign key (Car_id)
      references Card (id)
go

alter table consume_log
   add constraint FK_CONSUME__REFERENCE_USERS foreign key (Use_id)
      references Users (id)
go

