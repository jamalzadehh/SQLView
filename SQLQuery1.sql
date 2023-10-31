Create Database TaskArtist

Use TaskArtist

Create Table [Users](
[Id] Int Primary Key Identity,
[Name] Varchar(64) Not Null,
[Surname] Varchar(64) Default 'XXX',
[UserName]Varchar(64) Not Null,
[Password] Varchar(64) Not NUll,
[Gender] Varchar(8) Not Null
)

Create Table [Artist](
[Id] Int Primary Key Identity,
[Name] Varchar(64) Not Null,
[Surname] Varchar(64) Default 'XXX',
[Birthday] Varchar(10) Not Null,
[Gender] Varchar(8) Not Null
)

Create Table [Categories](
[Id] Int Primary Key Identity,
[Name] Varchar(64) Not Null,
)

Create Table [Musics](
[Id] Int Primary Key Identity,
[Name] Varchar(64) Not Null,
[Duration] Int,
[CategorieID] Int References [Categories](Id),
[ArtistId] Int References [Artist](Id)
)

Create Table [PlayList](
[UserId] Int References [Users](Id),
[MusicId] Int References [Musics](Id)
)

Insert [Users] Values
('Asiman','Qasimzada','AsamanBackDev','icki1122','Male'),
('Zulfiyya','Qurbanova','Zulu','pisik123','Male')

Insert [Artist] Values
('Shamama','Quliyeva','01.01.2004','Female'),
('Rashad','','04.03.2004','Male')

Insert [Categories] Values
('Naxcivan Milli Mahnisi'),
('Drill')

Insert [Musics] Values
('Naxcivanni qohumlarim hardadii', 180,1,1),
('Yeni 2023 xit by Rashaad', 159,2,2)

Insert [PlayList] Values
(1,1),
(2,2)

Create View [Details] As
Select 
    m.[Name] as 'Music Name',
    m.[Duration] as 'Duration',
    c.[Name] as 'Category',
    Concat(a.[Name],' ',a.[Surname]) as 'Artist'
From [Musics] m
Join [Categories] c ON m.[CategorieID] = c.[Id]
Join [Artist] a ON m.[ArtistId] = a.[Id]

Select*from Details






