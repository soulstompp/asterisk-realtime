/* The callusion schema is dedicated to asterisk related tables should be stored. Tables in this schema should inherit from tables in the asterisk schema ONLY */

drop table asterisk.contact_list_rotation_types cascade;

create table asterisk.contact_list_rotation_types (
  rotation_type_id serial not null,
  name varchar(20) not null,
  unique (name),
  primary key (rotation_type_id)
);

drop table asterisk.contact_lists cascade;

create table asterisk.contact_lists (
  contact_list_id serial not null,
  name varchar(40) not null,
  rotation_type_id int not null references asterisk.contact_list_rotation_types,
  last_rotation date not null,
  last_weekend_rotation date not null,
  primary key (contact_list_id),
  unique (name)
);

drop table asterisk.users cascade;

create table asterisk.users (
  user_id serial not null,
  user_name varchar(25) not null,
  internal_extension smallint not null,
  password varchar(20) not null,
  pin smallint not null,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(50) not null,
  pager varchar(50) not null,
  timezone varchar(10) not null,
  charset varchar(20) not null,
  primary key (user_id),
  unique (user_name)
);

drop table asterisk.contact_list_members cascade;

create table asterisk.contact_list_members (
  contact_list_id int not null,
  user_id int not null,
  position smallint,
  weekend_position smallint,
  fixed bool not null,
  primary key (contact_list_id, user_id),
  unique (contact_list_id, position),
  foreign key (user_id) references asterisk.users (user_id) on delete cascade on update cascade,
  foreign key (contact_list_id) references asterisk.contact_lists (contact_list_id) on delete cascade on update cascade
);

drop table asterisk.numbers cascade;

create table asterisk.numbers (
  number_id serial not null,
  number int not null,
  suspended boolean default false,
  primary key (number_id)
);

drop table asterisk.user_numbers;

create table asterisk.user_numbers (
  user_number_id serial not null,
  user_id int not null,
  number_type char(10) not null,
  number varchar(20) not null,
  availability char(168) not null default '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  primary key (user_number_id),
  foreign key (user_id) references asterisk.users (user_id) on delete cascade on update cascade,
  check (number_type in ('cell','home','office'))
);

drop table asterisk.calls cascade;

create table asterisk.calls (
  call_id serial not null,
  caller_number_id int not null,
  called_number_id int not null,
  disposition char(20) not null,
  call_start timestamp not null,
  bill_seconds int not null,
  primary key (call_id),
  foreign key (caller_number_id) references asterisk.numbers (number_id) on update cascade,
  foreign key (called_number_id) references asterisk.numbers (number_id) on update cascade
);

drop table asterisk.call_origination;

create table asterisk.call_origination (
  call_id int not null,
  did_id int not null,
  minute_rate decimal(12,2) not null,
  initial_increment smallint not null,
  toll_free_fee decimal(12,2) not null,
  pay_phone_fee decimal(12,2) not null,
  primary key(call_id),
  foreign key (call_id) references asterisk.calls (call_id) on update cascade on delete cascade
);

drop table asterisk.call_termination;

create table asterisk.call_termination (
  call_id int not null,
  trunk_id int not null,
  minute_rate decimal(12,2) not null,
  initial_increment smallint not null,
  primary key (call_id),
  foreign key (call_id) references asterisk.calls (call_id) on update cascade on delete cascade,
  foreign key (trunk_id) references realtime.trunks (trunk_id) on update cascade on delete cascade
);

drop table asterisk.routes cascade;

create table asterisk.routes (
  route_id serial not null,
  trunk_id int not null,
  prefix int not null,
  minute_rate decimal(12,2) not null,
  initial_increment smallint not null,
  primary key (route_id),
  foreign key (trunk_id) references realtime.trunks (trunk_id) on update cascade
);

drop table asterisk.did_statuses cascade;

create table asterisk.did_statuses (
  status_id serial not null,
  name varchar(20),
  primary key (status_id),
  unique (name)
);

insert into asterisk.did_statuses (name) values ('active');
insert into asterisk.did_statuses (name) values ('suspended');
insert into asterisk.did_statuses (name) values ('testing');

drop table asterisk.dids cascade;

create table asterisk.dids (
  did_id serial not null,
  status_id int not null,
  number int not null,
  minute_rate decimal(12,2) not null,
  monthly_rate decimal(12,2) not null,
  primary key (did_id),
  foreign key (status_id) references asterisk.did_statuses (status_id) on update cascade
);
