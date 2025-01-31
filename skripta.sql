USE [intellecta]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19.6.2024. 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 19.6.2024. 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CreatorId] [int] NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Subtitle] [nvarchar](max) NOT NULL,
	[DurationInWeeks] [int] NOT NULL,
	[WeeklyHours] [int] NOT NULL,
	[Highlights] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[CourseMark] [real] NOT NULL,
	[Approved] [bit] NOT NULL,
	[Price] [real] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseUser]    Script Date: 19.6.2024. 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseUser](
	[CoursesCourseId] [int] NOT NULL,
	[UsersId] [int] NOT NULL,
 CONSTRAINT [PK_CourseUser] PRIMARY KEY CLUSTERED 
(
	[CoursesCourseId] ASC,
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 19.6.2024. 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[VideoFile] [nvarchar](max) NOT NULL,
	[TxtFile] [nvarchar](max) NOT NULL,
	[WeekNumber] [int] NOT NULL,
	[FileOrder] [int] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 19.6.2024. 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[ReviewText] [nvarchar](max) NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistics]    Script Date: 19.6.2024. 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CourseId] [int] NULL,
	[MaterialId] [int] NULL,
	[Completed] [bit] NOT NULL,
	[Week] [int] NOT NULL,
 CONSTRAINT [PK_Statistics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.6.2024. 12:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[PasswordHash] [varbinary](max) NOT NULL,
	[PasswordSalt] [varbinary](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[UserType] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Approved] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240528172805_NewMigration', N'7.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240529112335_CourseStatistics', N'7.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240531204136_Statisticsss', N'7.0.0')
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (1, 6, N'Pilates', N'Kurs za instruktora pilatesa', 2, 3, N'Postanite sertifikovani pilates instruktor! Naučite vještine i tehnike vođenja pilates časova.', N'Zdravlje i fitnes', 5, 1, 36.99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (2, 6, N'Umjetnost samopouzdanja', N'Otkrijte snagu unutar sebe', 3, 3, N'Izgradite svoje samopouzdanje i otključajte potencijal kroz praktične vježbe i vođene meditacije.', N'Lični razvoj', 3.5, 1, 99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (3, 3, N'Putovanje kroz srpsku srednjovijekovnu istoriju', N'Otkrijte tajne Nemanjića i srednjovijekovne Srbije', 4, 4, N'Upoznajte slavnu prošlost Srbije kroz interaktivne lekcije i virtualne ekskurzije.', N'Društvene nauke', 5, 1, 149)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (4, 4, N'Srce na dlanu: Kardiologija u praksi', N'Otkrijte tajne zdravog srca i prevencije bolesti', 1, 5, N'Iskoristite najnovija medicinska saznanja i prakse za očuvanje zdravlja srca.', N'Zdravstvo i medicina', 5, 1, 79)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (5, 5, N'Magnetizam u svakodnevnom životu', N'Razumijevanje sila prirode: Magnetizam i njegova primjena', 2, 6, N'Otkrijte tajne magnetizma i primijenite ih u modernoj tehnologiji.', N'Inženjerstvo', 4, 1, 89)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (6, 5, N'Inteligentni računarski sistemi', N'Kroz digitalni svijet: Od logičkih kolа do vještačke inteligencije', 2, 6, N'Otkrijte tajne računarskih sistema i stvorite napredne digitalne projekte.', N'IT i tehnologije', 4.5, 1, 109)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (7, 4, N'Napredna pedijatrija', N'Briga o djeci: Od rođenja do adolescencije', 2, 4, N'Naučite ključne tehnike i prakse za zdrav razvoj djece i mladih!', N'Zdravstvo i medicina', 3, 1, 129)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (8, 7, N'Osnovi krivičnog prava', N'Pravda u akciji: Teorija i praksa krivičnog prava', 2, 4, N'Savladajte ključne koncepte krivičnog prava i primijenite ih u stvarnim slučajevima!', N'Pravne studije i pravo', 5, 1, 88)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (9, 3, N'Prvi svjetski rat: Rat koji je promijenio svijet', N'Od početka do kraja: Detaljna analiza Velikog rata', 2, 3, N'Upoznajte uzroke, događaje i posljedice Prvog svjetskog rata kroz detaljne lekcije i analize.', N'Društvene nauke', 4, 1, 57)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (10, 8, N'Hemijska jedinjenja: Osnova i primjena', N'Sve što trebate znati o hemijskim jedinjenjima', 1, 3, N'Istražite svijet hemijskih jedinjenja i njihov uticaj na naš svakodnevni život.', N'Prirodne nauke', 3, 1, 75.99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (11, 9, N'Kineski jezik za početnike', N'Uvod u Mandarin: Osnovne vještine i konverzacija', 3, 5, N'Savladajte osnove kineskog jezika kroz interaktivne lekcije i praktične vježbe!', N'Jezici', 4, 1, 96)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (12, 6, N'Odbojka za sve nivoe', N'Usavršite svoje vještine na terenu', 2, 3, N'Naučite osnovne i napredne tehnike odbojke uz stručne trenere i praktične vježbe.', N'Sport', 5, 1, 55.55)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (13, 9, N'Majstorstvo engleskih fraza', N'Osvajanje svakodnevne konverzacije', 2, 2, N'Usvojite ključne engleske fraze i poboljšajte svoje konverzacijske vještine brzo i lako.', N'Jezici', 4, 1, 49.79)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (14, 8, N'Čudesni svijet ljudskih organa', N'Istražite funkcije i tajne ljudskog tijela', 2, 3, N'Otkrijte kako rade ključni organi u tijelu kroz interaktivne lekcije i vizuelne prikaze.', N'Prirodne nauke', 5, 1, 33.8)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (15, 5, N'Kreativno umetanje u digitalni svijet', N'Oblak vaših snova: Kreirajte, povežite, inovirajte', 4, 4, N'Ovladajte programskim jezicima za oblak i stvorite budućnost digitalne revolucije.', N'IT i tehnologije', 3, 1, 63.99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (16, 10, N'Prirodna harmonija u modnom dizajnu', N'Inspiracija iz prirode: Boje, teksture, oblici', 3, 2, N'Spoznajte čari prirode u svijetu modnog dizajna. Izrazite svoju jedinstvenost i ostavite trag!', N'Modni dizajn', 5, 1, 112.99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (17, 11, N'Inovacije u građevinarstvu', N'Kreirajte budućnost: Napredne tehnike i materijali', 2, 5, N'Istaknite se kroz najnovije trendove i tehnologije građevinske industrije. Usavršite sebe!', N'Inženjerstvo', 5, 1, 66)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (18, 10, N'Virtuoza na klaviru i flauti', N'Harmonija klasičnih dvojnica', 4, 3, N'Uronite u čaroliju klavira i flaute kroz savršenu harmoniju sviranja i ovladajte umjetnošću muzike!', N'Umjetnost', 3.5, 1, 79)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (19, 7, N'Porodično pravo: Put ka pravnoj sigurnosti', N'Očuvanje porodičnih vrijednosti kroz pravne procese', 3, 4, N'Duboko zaronite u porodično pravo, osnažite se pravim znanjem i zaštitite svoju porodicu.', N'Pravne studije i pravo', 5, 1, 99.99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (20, 12, N'Strategije poslovnog razvoja', N'Ključne taktike za rast i uspjeh Vašeg biznisa', 2, 6, N'Usvojite inovativne strategije za poslovni rast i osnažite svoj biznis za buduće uspjehe.', N'Poslovni razvoj', 3, 1, 149.99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (21, 13, N'Osnove kliničke psihologije', N'Razumevanje i primjena psiholoških tehnika', 1, 4, N'Istražite koncepte kliničke psihologije i primijenite tehnike za poboljšanje mentalnog zdravlja.', N'Psihologija i savjetovanje', 5, 1, 33.33)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (22, 14, N'Inovativne metode u razrednoj nastavi', N'Poboljšajte nastavu kroz kreativne pristupe', 3, 3, N'Unaprijedite nastavničke vještine sa modernim i kreativnim metodama podučavanja!', N'Edukacija i podučavanje', 5, 1, 89.99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (23, 5, N'Uvod u nauku o podacima', N'Osnove analize i vizualizacije podataka', 1, 4, N'Naučite kako da analizirate i vizualizujete podatke koristeći najnovije alate i tehnike. ', N'Nauka o podacima', 5, 1, 99.99)
INSERT [dbo].[Courses] ([CourseId], [CreatorId], [Title], [Subtitle], [DurationInWeeks], [WeeklyHours], [Highlights], [Category], [CourseMark], [Approved], [Price]) VALUES (24, 12, N'Pletenje', N'Pletenje podnaslov', 1, 2, N'huidhiughiud', N'Lični razvoj', 0, 1, 50)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (1, 7)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (1, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (1, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (2, 1)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (2, 3)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (2, 5)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (2, 11)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (2, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (2, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (3, 6)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (3, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (4, 2)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (4, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (5, 1)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (6, 7)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (6, 8)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (7, 1)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (7, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (7, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (7, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (8, 11)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (9, 6)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (9, 9)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (10, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (11, 10)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (11, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (11, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (11, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (12, 2)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (12, 9)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (12, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (12, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (12, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (13, 2)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (13, 6)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (13, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (14, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (14, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (15, 9)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (16, 5)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (16, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (16, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (16, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (17, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (18, 2)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (18, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (18, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (18, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (19, 2)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (19, 10)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (20, 4)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (21, 8)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (21, 12)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (21, 14)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (22, 4)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (22, 13)
INSERT [dbo].[CourseUser] ([CoursesCourseId], [UsersId]) VALUES (23, 14)
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (1, 1, N'Test.pdf', N'Test.pdf', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (2, 1, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (3, 1, N'Test word dokument.docx', N'Test word dokument.docx', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (4, 1, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 2, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (5, 2, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (6, 2, N'Test.pdf', N'Test.pdf', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (7, 2, N'Test word dokument.docx', N'Test word dokument.docx', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (8, 2, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 3, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (9, 3, N'Test.pdf', N'Test.pdf', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (10, 3, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (11, 3, N'Test word dokument.docx', N'Test word dokument.docx', 3, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (12, 3, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 4, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (13, 4, N'Test.pdf', N'Test.pdf', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (14, 4, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (15, 4, N'Test word dokument.docx', N'Test word dokument.docx', 1, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (16, 4, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 1, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (17, 5, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (18, 5, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (19, 5, N'Test word dokument.docx', N'Test word dokument.docx', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (20, 5, N'Test.pdf', N'Test.pdf', 2, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (21, 6, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (22, 6, N'Test.pdf', N'Test.pdf', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (23, 6, N'Test word dokument.docx', N'Test word dokument.docx', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (24, 6, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 2, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (25, 7, N'Test.pdf', N'Test.pdf', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (26, 7, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (27, 7, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (28, 7, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (29, 8, N'Test.pdf', N'Test.pdf', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (30, 8, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (31, 9, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (32, 9, N'Test word dokument.docx', N'Test word dokument.docx', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (33, 9, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (34, 10, N'Test word dokument.docx', N'Test word dokument.docx', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (35, 10, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (36, 11, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (37, 11, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (38, 11, N'Test word dokument.docx', N'Test word dokument.docx', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (39, 11, N'Test.pdf', N'Test.pdf', 3, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (40, 12, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (41, 12, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (42, 12, N'Test word dokument.docx', N'Test word dokument.docx', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (43, 12, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 2, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (44, 13, N'Test.pdf', N'Test.pdf', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (45, 13, N'Test word dokument.docx', N'Test word dokument.docx', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (46, 13, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (47, 13, N'Test.pdf', N'Test.pdf', 2, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (48, 14, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (49, 14, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (50, 14, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (51, 14, N'Test word dokument.docx', N'Test word dokument.docx', 2, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (52, 15, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (53, 15, N'Test word dokument.docx', N'Test word dokument.docx', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (54, 15, N'Test.pdf', N'Test.pdf', 3, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (55, 16, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (56, 16, N'Test word dokument.docx', N'Test word dokument.docx', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (57, 16, N'Test.pdf', N'Test.pdf', 3, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (58, 17, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (59, 17, N'Test.pdf', N'Test.pdf', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (60, 17, N'Test word dokument.docx', N'Test word dokument.docx', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (61, 18, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (62, 18, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (63, 18, N'Test.pdf', N'Test.pdf', 3, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (64, 18, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 4, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (65, 19, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (66, 19, N'Test.pdf', N'Test.pdf', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (67, 19, N'Test word dokument.docx', N'Test word dokument.docx', 3, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (68, 19, N'Testni txt dokument.txt', N'Testni txt dokument.txt', 3, 4)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (69, 20, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (70, 20, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (71, 20, N'Test.pdf', N'Test.pdf', 2, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (72, 21, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (73, 21, N'Test word dokument.docx', N'Test word dokument.docx', 1, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (74, 21, N'Test.pdf', N'Test.pdf', 1, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (75, 22, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (76, 22, N'Test.pdf', N'Test.pdf', 2, 2)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (77, 22, N'Test word dokument.docx', N'Test word dokument.docx', 3, 3)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (78, 23, N'TEST VIDEO.mp4', N'TEST VIDEO.mp4', 1, 1)
INSERT [dbo].[Materials] ([ContentId], [CourseId], [VideoFile], [TxtFile], [WeekNumber], [FileOrder]) VALUES (79, 24, N'Test.pdf', N'Test.pdf', 1, 1)
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (1, 3, 2, N'Izvrstan kurs za sticanje samopouzdanja, sve pohvale kreatorki Dejanić!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (2, 2, 4, N'Kratko, jasno, precizno!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (3, 7, 6, N'Odličan kurs za početnike! Voljela bih da postoji napredniji nivo.', 4)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (4, 7, 1, N'Tek sam na polovini kursa, a već vidim promjene!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (5, 6, 9, N'Solidno!', 3)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (6, 6, 3, N'Sve pohvale za predavača!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (7, 9, 9, N'Odličan kurs. Sve objašnjeno na jednostavan način.', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (8, 9, 12, N'Sjajan kurs!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (9, 9, 15, N'Fali konkretnih primjera, ali solidno.', 3)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (10, 1, 5, N'Ovaj kurs je vrlo informativan i jasan. Voljela bih da je trajao duže, ali svakako je vrijedan svake minute', 4)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (11, 1, 7, N'Kurs pruža dobar uvod u osnovne principe pedijatrije, ali mislim da nedostaje dublja pokrivenost ključnih tema. Sve u svemu, zadovljna sam osnovnim informacijama, ali sam očekivala više detalja.', 3)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (12, 11, 8, N'Kurs je bio izuzetno detaljan i informativan! Predavač je bio sjajan, uvijek dostupan za dodatna pitanja. Definitivno vrijedan izdvojenog vremena!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (13, 10, 11, N'Ovaj kurs je bio odličan, naučila sam mnogo novih stvari, posebno o izgovoru i osnovama gramatike. Voljela bih da je bilo više prilike za vježbanje konverzacije!', 4)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (14, 5, 16, N'Zaista sam uživala dok sam pratila ovaj kurs, sve pohvala za kreatorku, nadam se da će uskoro objaviti još sličnog ili čak boljeg sadržaja!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (15, 5, 2, N'Solidno, ali sam očekivala više.', 3)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (16, 2, 13, N'Interesantan kurs. Zanimljivo za dodatna znanja, ali nije pretjerano poučan za savladavanje engleskog jezika.', 4)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (17, 2, 19, N'Odličan kurs, sve pohvale za predavača.', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (18, 13, 14, N'Interesantno i poučno, svi koncepti detaljno ali precizno objašnjeni!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (19, 14, 17, N'Savršen kurs za početnike, predavač uvijek dostupan za dodatna pitanja!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (20, 14, 10, N'Solidno, probajte da dodate malo više kreativnosti u sadržaj!', 3)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (21, 14, 18, N'Ne sviđa mi se, mislim da ipak nisam rođen za muziku.', 2)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (22, 4, 20, N'Dobar kurs za razumijevanje osnovnih koncepata, ali mu fali praktičnih primjera i situacija iz realnog svijeta.', 3)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (23, 4, 22, N'Vrlo korisno za razumijevanje načina predavanja gradiva djeci školskog uzrasta.', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (24, 8, 21, N'Veoma interesantan kurs, preporučio bih ga svima jer mentalno zdravlje ipak najbitnije!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (25, 8, 6, N'Zaista sam prezadovoljan, u današnjem svijetu tehnologija, svi bi trebalo da znamo da ih koristimo. Sve pohvale!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (26, 12, 2, N'Ovaj kurs je nesvakidašnji. Konačno sam stekao samopouzdanje!', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (27, 14, 23, N'Kurs je bio izuzetno detaljan i informativan. Predavač je bio sjajan - jasno je objašnjavao složene koncepte i uvek je bio dostupan za dodatna pitanja. Svi materijali su bili dobro pripremljeni, a interaktivni zadaci su bili veoma korisni.', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (28, 12, 18, N'Super', 5)
INSERT [dbo].[Reviews] ([Id], [UserId], [CourseId], [ReviewText], [Mark]) VALUES (29, 1, 2, N'Loš kurs', 1)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Statistics] ON 

INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (1, 3, 2, 7, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (2, 3, 2, 6, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (3, 3, 2, 5, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (4, 3, 2, 8, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (5, 2, 4, 15, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (6, 2, 4, 13, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (7, 2, 4, 16, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (8, 2, 4, 14, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (9, 1, 2, 5, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (10, 1, 2, 6, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (11, 1, 2, 7, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (12, 1, 2, 8, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (13, 7, 6, 23, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (14, 7, 6, 22, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (15, 7, 6, 21, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (16, 7, 6, 24, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (17, 7, 1, 1, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (18, 7, 1, 3, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (19, 7, 1, 2, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (20, 7, 1, 4, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (21, 6, 3, 10, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (22, 6, 3, 11, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (23, 6, 3, 9, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (24, 6, 3, 12, 0, 4)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (25, 6, 9, 32, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (26, 6, 9, 33, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (27, 6, 9, 31, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (28, 6, 13, 47, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (29, 6, 13, 46, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (30, 6, 13, 45, 0, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (31, 6, 13, 44, 0, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (32, 9, 9, 31, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (33, 9, 9, 32, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (34, 9, 9, 33, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (35, 9, 12, 41, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (36, 9, 12, 43, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (37, 9, 12, 42, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (38, 9, 12, 40, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (39, 9, 15, 52, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (40, 9, 15, 53, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (41, 9, 15, 54, 0, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (42, 1, 5, 18, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (43, 1, 5, 19, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (44, 1, 5, 20, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (45, 1, 5, 17, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (46, 1, 7, 27, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (47, 1, 7, 26, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (48, 1, 7, 28, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (49, 1, 7, 25, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (50, 11, 8, 29, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (51, 11, 8, 30, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (52, 10, 11, 37, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (53, 10, 11, 39, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (54, 10, 11, 38, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (55, 10, 11, 36, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (56, 10, 19, 66, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (57, 10, 19, 65, 0, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (58, 10, 19, 68, 0, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (59, 10, 19, 67, 0, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (60, 5, 16, 57, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (61, 5, 16, 56, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (62, 5, 16, 55, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (63, 5, 2, 6, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (64, 5, 2, 7, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (65, 5, 2, 5, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (66, 5, 2, 8, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (67, 2, 13, 45, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (68, 2, 13, 46, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (69, 2, 13, 44, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (70, 2, 13, 47, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (71, 2, 19, 66, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (72, 2, 19, 65, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (73, 2, 19, 67, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (74, 2, 19, 68, 0, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (75, 13, 14, 48, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (76, 13, 14, 51, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (77, 13, 14, 50, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (78, 13, 14, 49, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (79, 14, 17, 60, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (80, 14, 17, 58, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (81, 14, 17, 59, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (82, 14, 10, 35, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (83, 14, 10, 34, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (84, 14, 18, 61, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (85, 14, 18, 62, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (86, 14, 18, 63, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (87, 14, 18, 64, 1, 4)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (88, 4, 20, 69, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (89, 4, 20, 71, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (90, 4, 20, 70, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (91, 4, 22, 77, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (92, 4, 22, 75, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (93, 4, 22, 76, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (94, 8, 21, 72, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (95, 8, 21, 73, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (96, 8, 21, 74, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (97, 8, 6, 21, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (98, 8, 6, 24, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (99, 8, 6, 23, 1, 2)
GO
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (100, 8, 6, 22, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (101, 12, 2, 5, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (102, 12, 2, 7, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (103, 12, 2, 8, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (104, 12, 2, 6, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (105, 12, 1, 3, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (106, 12, 1, 1, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (107, 12, 1, 2, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (108, 12, 1, 4, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (109, 12, 7, 26, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (110, 12, 7, 25, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (111, 12, 7, 27, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (112, 12, 7, 28, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (113, 12, 11, 38, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (114, 12, 11, 39, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (115, 12, 11, 37, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (116, 12, 11, 36, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (117, 12, 12, 41, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (118, 12, 12, 40, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (119, 12, 12, 42, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (120, 12, 12, 43, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (121, 12, 16, 55, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (122, 12, 16, 57, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (123, 12, 16, 56, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (124, 12, 18, 62, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (125, 12, 18, 63, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (126, 12, 18, 61, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (127, 12, 18, 64, 1, 4)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (128, 12, 21, 74, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (129, 12, 21, 73, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (130, 12, 21, 72, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (131, 13, 1, 4, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (132, 13, 1, 1, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (133, 13, 1, 2, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (134, 13, 1, 3, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (135, 13, 2, 7, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (136, 13, 2, 8, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (137, 13, 2, 5, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (138, 13, 2, 6, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (139, 13, 4, 16, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (140, 13, 4, 15, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (141, 13, 4, 13, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (142, 13, 4, 14, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (143, 13, 7, 25, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (144, 13, 7, 26, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (145, 13, 7, 28, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (146, 13, 7, 27, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (147, 13, 11, 38, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (148, 13, 11, 37, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (149, 13, 11, 36, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (150, 13, 11, 39, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (151, 13, 12, 41, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (152, 13, 12, 40, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (153, 13, 12, 42, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (154, 13, 12, 43, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (155, 13, 16, 56, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (156, 13, 16, 57, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (157, 13, 16, 55, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (158, 13, 18, 61, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (159, 13, 18, 64, 1, 4)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (160, 13, 18, 62, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (161, 13, 18, 63, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (162, 13, 22, 75, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (163, 13, 22, 77, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (164, 13, 22, 76, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (165, 14, 21, 74, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (166, 14, 21, 72, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (167, 14, 21, 73, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (168, 14, 13, 45, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (169, 14, 13, 46, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (170, 14, 13, 44, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (171, 14, 13, 47, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (172, 14, 16, 57, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (173, 14, 16, 55, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (174, 14, 16, 56, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (175, 14, 14, 49, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (176, 14, 14, 51, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (177, 14, 14, 50, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (178, 14, 14, 48, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (179, 14, 12, 41, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (180, 14, 12, 40, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (181, 14, 12, 42, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (182, 14, 12, 43, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (183, 14, 11, 38, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (184, 14, 11, 37, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (185, 14, 11, 36, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (186, 14, 11, 39, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (187, 14, 7, 27, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (188, 14, 7, 26, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (189, 14, 7, 25, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (190, 14, 7, 28, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (191, 14, 23, 78, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (192, 2, 12, 41, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (193, 2, 12, 40, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (194, 2, 12, 43, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (195, 2, 12, 42, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (196, 2, 18, 61, 0, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (197, 2, 18, 63, 0, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (198, 2, 18, 62, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (199, 2, 18, 64, 0, 4)
GO
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (200, 11, 2, 8, 1, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (201, 11, 2, 6, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (202, 11, 2, 5, 1, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (203, 11, 2, 7, 1, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (204, 12, 3, 11, 0, 3)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (205, 12, 3, 10, 0, 2)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (206, 12, 3, 9, 0, 1)
INSERT [dbo].[Statistics] ([Id], [UserId], [CourseId], [MaterialId], [Completed], [Week]) VALUES (207, 12, 3, 12, 0, 4)
SET IDENTITY_INSERT [dbo].[Statistics] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (1, N'jugovicivana12@gmail.com', N'Ivana', N'Jugović', 0x3622F70F1B50E22105AB8F70AD6DD6054CEE4144D634B49F73F1ADFE266B8F998A77A9B8C05FDACF08E39FBBFEABE769A749B0A8184A64BD12B6A14E6FE16134, 0xEB8DF5C57A346E24BC095DF9CE23BB44C3453C6734C4792969829E5E1A8A1BC780EE24DE5F9C05419E1DF4E3A0A5DEEFD06273D84390138E305F548C06720425D72307BCDF1A2E02593E811A4BC449E4A4E046DF823345C340D640F2D116F1DC83666D35AA460FA75B270D8E6034BD21E7B607E7D142B4BFC3B960CAE0724B88, CAST(N'2000-12-01T00:00:00.0000000' AS DateTime2), N'Admin', N'Student', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (2, N'lenasaraba8@gmail.com', N'Lena', N'Šaraba', 0xC028E4DFE1D651BEF6AE9DC26C5183996B2D2EC2B84172AC5CC76088A5C33769B7C05D244399425B8181096680677AE6601E2E811065BE2A3CF6705151CED1C2, 0xF928C981A047CD5CE16FE8CFA09A82C8DB781E4119BFEE641750DBD976D9E2FF4D878A36514A8F7119F5C3B5A1D9547C4C9E003C7DD2E6AF7727C483788D3477BBFB284242F6372FBDD4657C2C819D2653D2BF498D420F4690A22645EE3F8FEA18CD54F8E1C4EBE37F0390AE8978DB1EAD6593ABADCA8B1FC6E48F2DF64533F2, CAST(N'2001-07-31T00:00:00.0000000' AS DateTime2), N'Admin', N'Student', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (3, N'lenassslena1@gmail.com', N'Marko', N'Marković', 0x34EB5A2276A442CD13111BB565290579079CC68FE842B65A61423A28970E1A91564AABB0109BCC109EDDE004BBE12E36549C93D8939171371AED023E2CF35082, 0x2FB02B161684C946EC44A17F225EFF230FD90997DD786DDF803C9EE306CF84A5A8655EF01DC9AD436BB185267141D52C5C9583F201652549CD58416DF4289F92779A964361C40DA727E7EEAB746A9F1D120F72E7C397D53B2F9E015D5B95582FBC44929039571F2635F0CB0390D7F484F59E5CE342C6E2CA3421C7320EFCE021, CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Diplomirani profesor istorije', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (4, N'ivanajugovic022@gmail.com', N'Petar', N'Petrović', 0x4D7A0DB7ACF3B8D2543407E407CD72244767519DAA1338EBD691363F48D0F76B8E40780CEBCBB6D40780CEAE4E2A79880E72F03B6712E02D0536A0347FE85F5D, 0x5958235DDD74FF8685417CC797697DE2A5F055F2BDDBB02BC2244C52320DD4D6563D692FA6FB2FEED30F0F15E842F4829E9C9386F49A2D2E45F1BBEE6166495DCCD90505E77F01C22704307746EE29564B1889F19369C0CA70BBD2DDFAFDBB6D4D00292A2A0C63DE907E56B715354DCCEF6588E7BC55ED0E57C6EAB4EE063393, CAST(N'1976-02-02T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Doktor medicine', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (5, N'lenasaraba@hotmail.com', N'Bojana', N'Bojanić', 0xB58F09856299C731E88AF14E2BBB36C86144D187B513ED217E7422B2473707667F16DE890543CF6CA6C020913636CDEE3B0437BC5F2BED53C4E7F23C0403739E, 0x7D1766D4654A1D3A25A7C1CB870F88053CF84FCCBB51058575BB1F9E24201D1C2E0EFAEB50AFBF345107D7A0D50EBF33D33FE64799A894719B6B40EDCD4A80EE6C6BEB9F74B3D91FC2CF448FF46581C39346F9DF35119AB44162901E5138ECC0DA1668735DF674BDF3341DC1C9257B3077E849A360A80D4F94C376A7B64D24F6, CAST(N'1991-03-03T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Diplomirani inženjer elektrotehnike', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (6, N'iigrice44@gmail.com', N'Dejana', N'Dejanić', 0x4D4BCB5B36CE00F74B22F1AEC30A335FF240FDF3AAA54BCAC448D0FB7DC1196669AFF5D00C93D8B32F22C206D71AE1A120A82958D8EBDE2DD3BADB6A51BAA2D3, 0x45F61A6CBB164C2952FBAC9F82ACE5BE88258FEE251A24118B76A67E40F9FE8F37750112EB3DEEC43A6BFA0A8C2B9214983E8B0C3CD06D58BAC2784828305F5283EA0BCD40B19CD7F99062D1C759BF018C821EF80FFF71D760D60610F00E80B8F8F3582EA40FD6CBC431AC1FF8CBC00CD0976BAAD451B28B53B506E7D1B1EBEB, CAST(N'1986-04-04T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Diplomirani profesor fizičkog vaspitanja', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (7, N'marijasaraba@gmail.com', N'Jovana', N'Jovanović', 0x135D309D8219678B0C79EA571034BCAD34A651F37C736B7C072338F503D51D2279C4A5011765135348DA95236DFA5A098625982721803CD9A36B231ABD2DE5B0, 0x34876FD33F8C3E25E52159D45F595320A0D635E885218FFD559B9A38756DE198323BEA86DACE5D33C6116CB9A3420097ABAEF24BD815D2C20F630E9561C3415580A0357E02B8C23718BB2C8B0D284B2B73868469ACF223293752939AFE4352D7948239943BCE5FE2C8CF2FFF4C9A050AD4286BFD9178E957C9019E81FCE93BCC, CAST(N'1982-06-08T00:00:00.0000000' AS DateTime2), N'Admin', N'Diplomirani pravnik', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (8, N'jjugovic73@gmail.com', N'Damjan', N'Damjanović', 0xFA12CFDA5BED8F21246B5214A749A781151B57D1A5FB6B37196E6A5686E9460870ACCE33EF4AACD3E702EC0D78E1D48BF81CAD99F46655169ED96781DC2D7ECC, 0x65E14148C05739EEC3A42F10369203AE8286933CD6588BF9B1C2CF50DB3589E99AC7A3766032DBB79211C0AB595F61CF6DCF6DEC369D0856049DDFAB5CCF881D2D0F25E248626D0D53AFA68874345F9685C67A01F77582DE51D501BD7B599482418DEC7864B3E2F7919AA57A6558468EEABB7B7BAB458E4EC69A7253B1379359, CAST(N'1973-09-09T00:00:00.0000000' AS DateTime2), N'Admin', N'Profesor hemije', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (9, N'lena.saraba.2094@student.etf.ues.rs.ba', N'Nikola', N'Nikolić', 0x6F16ED0DF3FCEFF35BF7E84970D7897B3CF20923B79BC4203D403B61674E7C05031F2C32359FA63EE37C91C0E780273464D1A128E5540FDD8F8DC5D079C03658, 0x5DD74295A592B18A191FD9B63137CB67A1A3C68AC52874A6888CA341C1EE484C42C5DB81945633D49EAC3BA3FC042F2D1A5BE74C3B4C1251E529508F75E39C918F8CCD1A58C6A4A61D4DE49945D5FDED2B02D97D6CF7B96F845786FAC8ADB66BB21EF4D19EABD2089F0539FF46AE25C887E098D743FE2E8D1FD1AD1CB67A1D7D, CAST(N'1979-10-10T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Profesor engleskog i kineskog jezika', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (10, N'nalogacc1@gmail.com', N'Lucija', N'Lučić', 0x20BE7CBAE4C9B1AA9C5CD64CAA757565AC4EBA545C38D0C01B7ED1A6D35BD32B0FFA372925A1324EE247827A5C78D4BD50F1FF800003BD205924280C0506E775, 0xC3B06996FA060A30CDF52E56146880CE102372B189DC9A55522C320BFBF0AF850235ECA730A18CECCF25F1F14A0F221B8849097F1F1A819B895070F2BB5E11C4450A40285B30060F2668FEDE3DE156DE130C0E59D4B12E0B45EB51FD98F832364212709D13952A8B152C8FCE6EADC93F3B1F925429612A8CDAB707F042F40787, CAST(N'1996-06-06T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Umjetnica', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (11, N'ivana.jugovic.2121@student.etf.ues.rs.ba', N'David', N'Davidović', 0xD9A67E7DC70D8C3EEF705960A2872344693D85EF7CFEF7ED65AC1435CDDA3AC8EB803B4DB7694B26A16031C02FB6DE8A100DC2FF6D0EF458B7033285ACD0C79E, 0xCFAC0DD43EDFF118302F337177676BD20CEB0988EE1099B6A8B5A91993D6F4DA519CBF7D645A49C1F7BBDBDE5CD319CFB422E7327E27A3147422E55A7362285243658314050C3225CBEF80C69280F32158BAD8A8F975A70E9775B528A389F6209A3A5DC3565CF74CAC213C70DC5DBE1B0B0E2E4BD3A91FD1A6CE06261B48E4B8, CAST(N'1980-07-07T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Inženjer građevinarstva', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (12, N'nemanja.brckalo.2120@student.etf.ues.rs.ba', N'Nemanja', N'Nemanjić', 0xCFBD76767F1D44DB6D96301F5AB3FD9410F632C01B9D7E5AB4EA8BB9D5C868D7A07D5BDE8608CFDF0260C01411A6CBD29E15D60E4FCE5F24BF0B195ABCB22A21, 0xCA8B33B64FFE05CE7F04DA899D165D74C4606F417AE4898622D9CC7610F010ADC2730395F9FF49D072B25EFD08244A5C66AD134A6A575262514D0D4861137A1ABDEBA703F8D0CE3B107FCE4F44ED35599251BD6F34D64344E4E141877FC00B5885971B6803F23EB61F59BCCC0BF582A1350D3FE22CF9D6132B0AF0A5149BCC82, CAST(N'2001-07-09T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Diplomirani ekonomista', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (13, N'stefan.ristic.2134@student.etf.ues.rs.ba', N'Stefan', N'Stefanović', 0x445D2F2230639DB9EFB142B9D09F0893D916FDF8E79C0979C3A3CA5B7A75DDC1D86F510F88C73A010431B4844EBE9C44C3F7D997904590231EA6F2F867AE6E3C, 0x1250681CB6079470ED8F40CDDDB001DEEE08F5058949EEC491BE7FA2443568F0AF731C1B3BF61DFF90E4AFBC9953FB5C424609EFC90C5A06E3D515EA897F766D14FF76216902579F0218409DA364AF73B3D4AC690B2AF464A59013F2E1A1BFF2C45CC02D60C8B9C10DC13F72757613F71184D0A605235D48B401CDA267164561, CAST(N'2001-06-30T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Diplomirani psiholog', 1)
INSERT [dbo].[Users] ([Id], [Email], [FirstName], [LastName], [PasswordHash], [PasswordSalt], [DateOfBirth], [UserType], [Title], [Approved]) VALUES (14, N'aleksandar.vidakovic.2103@student.etf.ues.rs.ba', N'Aleksandar', N'Aleksić', 0x2507387A9456F2E9D4BF93ADCC79C02D68A268F564E2537CC39D42087577A2C995B4ECAE9F9EDDD874315BF726077031DA0B397DEE7652EB1132F79F6183585D, 0x23B51D812C5FC14BBE47F40B8CDB2DBBD052CB19612EDB72940BD31E5C35045B7381DBECED5FE84177CF319074D74B2D749C0AB9BD89321344314CAA92DFC0A463A6B578CA3D56D0B113F32C2E2120CE1D7EC46A4D9B72918C5E8937C29036FAE09368B2846FD43B3D6614C6D5CC9BB624459B13C3B3F12427F5D8C9FB552ED8, CAST(N'2001-08-20T00:00:00.0000000' AS DateTime2), N'Korisnik', N'Profesor razredne nastave', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Statistics] ADD  DEFAULT ((0)) FOR [Week]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Users_CreatorId] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Users_CreatorId]
GO
ALTER TABLE [dbo].[CourseUser]  WITH CHECK ADD  CONSTRAINT [FK_CourseUser_Courses_CoursesCourseId] FOREIGN KEY([CoursesCourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseUser] CHECK CONSTRAINT [FK_CourseUser_Courses_CoursesCourseId]
GO
ALTER TABLE [dbo].[CourseUser]  WITH CHECK ADD  CONSTRAINT [FK_CourseUser_Users_UsersId] FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CourseUser] CHECK CONSTRAINT [FK_CourseUser_Users_UsersId]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Courses_CourseId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Courses_CourseId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users_UserId]
GO
ALTER TABLE [dbo].[Statistics]  WITH CHECK ADD  CONSTRAINT [FK_Statistics_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Statistics] CHECK CONSTRAINT [FK_Statistics_Courses_CourseId]
GO
ALTER TABLE [dbo].[Statistics]  WITH CHECK ADD  CONSTRAINT [FK_Statistics_Materials_MaterialId] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([ContentId])
GO
ALTER TABLE [dbo].[Statistics] CHECK CONSTRAINT [FK_Statistics_Materials_MaterialId]
GO
ALTER TABLE [dbo].[Statistics]  WITH CHECK ADD  CONSTRAINT [FK_Statistics_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Statistics] CHECK CONSTRAINT [FK_Statistics_Users_UserId]
GO
