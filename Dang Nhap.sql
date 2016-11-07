CREATE DATABASE Login
USE Login

CREATE TABLE Login
(
	id char (3) not null primary key,
	UserName varchar (20),
	PassWord varchar (20)
)

insert into Login values ('1', 'TC01', '0001')
insert into Login values ('2', 'TC02', '0002')
insert into Login values ('3', 'TC03', '0003')
insert into Login values ('4', 'TC04', '0004')
insert into Login values ('5', 'TC05', '0005')

go

create alter proc sp_Login
	@UserName varchar(20),
	@PassWord varchar (20)
as
	declare @UN varchar (20) = (select UserName from Login where UserName = @UserName)
	declare @PW varchar (20) = (select PassWord from Login where UserName = @UserName and PassWord = @PassWord)								
	
begin
	if(@UserName = '' or @PassWord = '')
		print 'Error! UserName or PassWord empty!'
	else
		begin
			if(@UserName = @UN)
				begin
					if(@PassWord = @PW)
						Select 1
					else 
						Select 0
				end
			else
				Select -1
		end
end
