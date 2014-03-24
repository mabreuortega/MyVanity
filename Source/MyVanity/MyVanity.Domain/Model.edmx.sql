
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/24/2014 12:50:26
-- Generated from EDMX file: C:\Users\Miguel\My Projects\MyVanity\Repository\Source\MyVanity\MyVanity.Domain\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MyVanity];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SentMessages]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Messages] DROP CONSTRAINT [FK_SentMessages];
GO
IF OBJECT_ID(N'[dbo].[FK_Inbox]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Messages] DROP CONSTRAINT [FK_Inbox];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientUserProcedure]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserProcedures] DROP CONSTRAINT [FK_PatientUserProcedure];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedureUserProcedure]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserProcedures] DROP CONSTRAINT [FK_ProcedureUserProcedure];
GO
IF OBJECT_ID(N'[dbo].[FK_MessageAttachments]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents_MessageAttachment] DROP CONSTRAINT [FK_MessageAttachments];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientDocuments]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents_PatientDocument] DROP CONSTRAINT [FK_PatientDocuments];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProcedureAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_UserProcedureAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_StateContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [FK_StateContact];
GO
IF OBJECT_ID(N'[dbo].[FK_ContactPatient]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Patient] DROP CONSTRAINT [FK_ContactPatient];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedureCategoryProcedure]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Procedures] DROP CONSTRAINT [FK_ProcedureCategoryProcedure];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentCategoryDocumentSubcategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DocumentSubcategories] DROP CONSTRAINT [FK_DocumentCategoryDocumentSubcategory];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentCategoryDocument]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_DocumentCategoryDocument];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentSubcategoryDocument]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_DocumentSubcategoryDocument];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedureTypeProcedure]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Procedures] DROP CONSTRAINT [FK_ProcedureTypeProcedure];
GO
IF OBJECT_ID(N'[dbo].[FK_Patient_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Patient] DROP CONSTRAINT [FK_Patient_inherits_User];
GO
IF OBJECT_ID(N'[dbo].[FK_MessageAttachment_inherits_Document]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents_MessageAttachment] DROP CONSTRAINT [FK_MessageAttachment_inherits_Document];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientDocument_inherits_Document]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents_PatientDocument] DROP CONSTRAINT [FK_PatientDocument_inherits_Document];
GO
IF OBJECT_ID(N'[dbo].[FK_Admin_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Admin] DROP CONSTRAINT [FK_Admin_inherits_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Agent_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Agent] DROP CONSTRAINT [FK_Agent_inherits_User];
GO
IF OBJECT_ID(N'[dbo].[FK_SharedDocument_inherits_Document]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents_SharedDocument] DROP CONSTRAINT [FK_SharedDocument_inherits_Document];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Messages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Messages];
GO
IF OBJECT_ID(N'[dbo].[Procedures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Procedures];
GO
IF OBJECT_ID(N'[dbo].[UserProcedures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserProcedures];
GO
IF OBJECT_ID(N'[dbo].[Documents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents];
GO
IF OBJECT_ID(N'[dbo].[Appointments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Appointments];
GO
IF OBJECT_ID(N'[dbo].[Contacts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contacts];
GO
IF OBJECT_ID(N'[dbo].[States]', 'U') IS NOT NULL
    DROP TABLE [dbo].[States];
GO
IF OBJECT_ID(N'[dbo].[ProcedureCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProcedureCategories];
GO
IF OBJECT_ID(N'[dbo].[DocumentCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DocumentCategories];
GO
IF OBJECT_ID(N'[dbo].[DocumentSubcategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DocumentSubcategories];
GO
IF OBJECT_ID(N'[dbo].[ProcedureTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProcedureTypes];
GO
IF OBJECT_ID(N'[dbo].[Users_Patient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_Patient];
GO
IF OBJECT_ID(N'[dbo].[Documents_MessageAttachment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents_MessageAttachment];
GO
IF OBJECT_ID(N'[dbo].[Documents_PatientDocument]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents_PatientDocument];
GO
IF OBJECT_ID(N'[dbo].[Users_Admin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_Admin];
GO
IF OBJECT_ID(N'[dbo].[Users_Agent]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_Agent];
GO
IF OBJECT_ID(N'[dbo].[Documents_SharedDocument]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents_SharedDocument];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Profile_FirstName] nvarchar(max)  NOT NULL,
    [Profile_LastName] nvarchar(max)  NOT NULL,
    [Profile_MiddleName] nvarchar(max)  NULL,
    [Profile_Sex] int  NOT NULL,
    [Profile_DOB] datetime  NULL,
    [Profile_SSN] nvarchar(max)  NOT NULL,
    [Profile_License] nvarchar(max)  NULL
);
GO

-- Creating table 'Messages'
CREATE TABLE [dbo].[Messages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Subject] nvarchar(max)  NOT NULL,
    [Body] nvarchar(max)  NULL,
    [ToId] int  NOT NULL,
    [FromId] int  NOT NULL
);
GO

-- Creating table 'Procedures'
CREATE TABLE [dbo].[Procedures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CategoryId] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [RegularPrice_Amount] decimal(18,0)  NOT NULL,
    [RegularPrice_Currency] int  NOT NULL,
    [SalePrice_Amount] decimal(18,0)  NOT NULL,
    [SalePrice_Currency] int  NOT NULL,
    [TypeId] int  NOT NULL
);
GO

-- Creating table 'UserProcedures'
CREATE TABLE [dbo].[UserProcedures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PatientId] int  NOT NULL,
    [ProcedureId] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [State] int  NOT NULL
);
GO

-- Creating table 'Documents'
CREATE TABLE [dbo].[Documents] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Path] nvarchar(max)  NOT NULL,
    [Censured] nvarchar(max)  NOT NULL,
    [CategoryId] int  NOT NULL,
    [SubcategoryId] int  NULL,
    [ContentType] int  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [UserProcedureId] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [Status] int  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Contacts'
CREATE TABLE [dbo].[Contacts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Address_Street] nvarchar(max)  NULL,
    [Address_City] nvarchar(max)  NULL,
    [Phone_Home] nvarchar(max)  NULL,
    [Phone_Work] nvarchar(max)  NULL,
    [Phone_Mobile] nvarchar(max)  NULL,
    [ZipCode_Number] nvarchar(max)  NULL,
    [ZipCode_Extra] nvarchar(max)  NOT NULL,
    [StateId] int  NOT NULL,
    [Social_Email] nvarchar(max)  NOT NULL,
    [Social_Facebook] nvarchar(max)  NULL,
    [Social_Twitter] nvarchar(max)  NULL,
    [Address2_Street] nvarchar(max)  NULL,
    [Address2_City] nvarchar(max)  NULL
);
GO

-- Creating table 'States'
CREATE TABLE [dbo].[States] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Abbr] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProcedureCategories'
CREATE TABLE [dbo].[ProcedureCategories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DocumentCategories'
CREATE TABLE [dbo].[DocumentCategories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'DocumentSubcategories'
CREATE TABLE [dbo].[DocumentSubcategories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CategoryId] int  NOT NULL
);
GO

-- Creating table 'ProcedureTypes'
CREATE TABLE [dbo].[ProcedureTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Users_Patient'
CREATE TABLE [dbo].[Users_Patient] (
    [Number] nvarchar(max)  NOT NULL,
    [ContactId] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Documents_MessageAttachment'
CREATE TABLE [dbo].[Documents_MessageAttachment] (
    [MessageId] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Documents_PatientDocument'
CREATE TABLE [dbo].[Documents_PatientDocument] (
    [PatientId] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Users_Admin'
CREATE TABLE [dbo].[Users_Admin] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Users_Agent'
CREATE TABLE [dbo].[Users_Agent] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Documents_SharedDocument'
CREATE TABLE [dbo].[Documents_SharedDocument] (
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Messages'
ALTER TABLE [dbo].[Messages]
ADD CONSTRAINT [PK_Messages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Procedures'
ALTER TABLE [dbo].[Procedures]
ADD CONSTRAINT [PK_Procedures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserProcedures'
ALTER TABLE [dbo].[UserProcedures]
ADD CONSTRAINT [PK_UserProcedures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [PK_Documents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserProcedureId], [Date] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [PK_Appointments]
    PRIMARY KEY CLUSTERED ([UserProcedureId], [Date] ASC);
GO

-- Creating primary key on [Id] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [PK_Contacts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'States'
ALTER TABLE [dbo].[States]
ADD CONSTRAINT [PK_States]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProcedureCategories'
ALTER TABLE [dbo].[ProcedureCategories]
ADD CONSTRAINT [PK_ProcedureCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DocumentCategories'
ALTER TABLE [dbo].[DocumentCategories]
ADD CONSTRAINT [PK_DocumentCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [CategoryId] in table 'DocumentSubcategories'
ALTER TABLE [dbo].[DocumentSubcategories]
ADD CONSTRAINT [PK_DocumentSubcategories]
    PRIMARY KEY CLUSTERED ([Id], [CategoryId] ASC);
GO

-- Creating primary key on [Id] in table 'ProcedureTypes'
ALTER TABLE [dbo].[ProcedureTypes]
ADD CONSTRAINT [PK_ProcedureTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users_Patient'
ALTER TABLE [dbo].[Users_Patient]
ADD CONSTRAINT [PK_Users_Patient]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Documents_MessageAttachment'
ALTER TABLE [dbo].[Documents_MessageAttachment]
ADD CONSTRAINT [PK_Documents_MessageAttachment]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Documents_PatientDocument'
ALTER TABLE [dbo].[Documents_PatientDocument]
ADD CONSTRAINT [PK_Documents_PatientDocument]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users_Admin'
ALTER TABLE [dbo].[Users_Admin]
ADD CONSTRAINT [PK_Users_Admin]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users_Agent'
ALTER TABLE [dbo].[Users_Agent]
ADD CONSTRAINT [PK_Users_Agent]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Documents_SharedDocument'
ALTER TABLE [dbo].[Documents_SharedDocument]
ADD CONSTRAINT [PK_Documents_SharedDocument]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [FromId] in table 'Messages'
ALTER TABLE [dbo].[Messages]
ADD CONSTRAINT [FK_SentMessages]
    FOREIGN KEY ([FromId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SentMessages'
CREATE INDEX [IX_FK_SentMessages]
ON [dbo].[Messages]
    ([FromId]);
GO

-- Creating foreign key on [ToId] in table 'Messages'
ALTER TABLE [dbo].[Messages]
ADD CONSTRAINT [FK_Inbox]
    FOREIGN KEY ([ToId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Inbox'
CREATE INDEX [IX_FK_Inbox]
ON [dbo].[Messages]
    ([ToId]);
GO

-- Creating foreign key on [PatientId] in table 'UserProcedures'
ALTER TABLE [dbo].[UserProcedures]
ADD CONSTRAINT [FK_PatientUserProcedure]
    FOREIGN KEY ([PatientId])
    REFERENCES [dbo].[Users_Patient]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientUserProcedure'
CREATE INDEX [IX_FK_PatientUserProcedure]
ON [dbo].[UserProcedures]
    ([PatientId]);
GO

-- Creating foreign key on [ProcedureId] in table 'UserProcedures'
ALTER TABLE [dbo].[UserProcedures]
ADD CONSTRAINT [FK_ProcedureUserProcedure]
    FOREIGN KEY ([ProcedureId])
    REFERENCES [dbo].[Procedures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedureUserProcedure'
CREATE INDEX [IX_FK_ProcedureUserProcedure]
ON [dbo].[UserProcedures]
    ([ProcedureId]);
GO

-- Creating foreign key on [MessageId] in table 'Documents_MessageAttachment'
ALTER TABLE [dbo].[Documents_MessageAttachment]
ADD CONSTRAINT [FK_MessageAttachments]
    FOREIGN KEY ([MessageId])
    REFERENCES [dbo].[Messages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MessageAttachments'
CREATE INDEX [IX_FK_MessageAttachments]
ON [dbo].[Documents_MessageAttachment]
    ([MessageId]);
GO

-- Creating foreign key on [PatientId] in table 'Documents_PatientDocument'
ALTER TABLE [dbo].[Documents_PatientDocument]
ADD CONSTRAINT [FK_PatientDocuments]
    FOREIGN KEY ([PatientId])
    REFERENCES [dbo].[Users_Patient]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientDocuments'
CREATE INDEX [IX_FK_PatientDocuments]
ON [dbo].[Documents_PatientDocument]
    ([PatientId]);
GO

-- Creating foreign key on [UserProcedureId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_UserProcedureAppointment]
    FOREIGN KEY ([UserProcedureId])
    REFERENCES [dbo].[UserProcedures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [StateId] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [FK_StateContact]
    FOREIGN KEY ([StateId])
    REFERENCES [dbo].[States]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StateContact'
CREATE INDEX [IX_FK_StateContact]
ON [dbo].[Contacts]
    ([StateId]);
GO

-- Creating foreign key on [ContactId] in table 'Users_Patient'
ALTER TABLE [dbo].[Users_Patient]
ADD CONSTRAINT [FK_ContactPatient]
    FOREIGN KEY ([ContactId])
    REFERENCES [dbo].[Contacts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ContactPatient'
CREATE INDEX [IX_FK_ContactPatient]
ON [dbo].[Users_Patient]
    ([ContactId]);
GO

-- Creating foreign key on [CategoryId] in table 'Procedures'
ALTER TABLE [dbo].[Procedures]
ADD CONSTRAINT [FK_ProcedureCategoryProcedure]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[ProcedureCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedureCategoryProcedure'
CREATE INDEX [IX_FK_ProcedureCategoryProcedure]
ON [dbo].[Procedures]
    ([CategoryId]);
GO

-- Creating foreign key on [CategoryId] in table 'DocumentSubcategories'
ALTER TABLE [dbo].[DocumentSubcategories]
ADD CONSTRAINT [FK_DocumentCategoryDocumentSubcategory]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[DocumentCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentCategoryDocumentSubcategory'
CREATE INDEX [IX_FK_DocumentCategoryDocumentSubcategory]
ON [dbo].[DocumentSubcategories]
    ([CategoryId]);
GO

-- Creating foreign key on [CategoryId] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_DocumentCategoryDocument]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[DocumentCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentCategoryDocument'
CREATE INDEX [IX_FK_DocumentCategoryDocument]
ON [dbo].[Documents]
    ([CategoryId]);
GO

-- Creating foreign key on [SubcategoryId], [CategoryId] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_DocumentSubcategoryDocument]
    FOREIGN KEY ([SubcategoryId], [CategoryId])
    REFERENCES [dbo].[DocumentSubcategories]
        ([Id], [CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentSubcategoryDocument'
CREATE INDEX [IX_FK_DocumentSubcategoryDocument]
ON [dbo].[Documents]
    ([SubcategoryId], [CategoryId]);
GO

-- Creating foreign key on [TypeId] in table 'Procedures'
ALTER TABLE [dbo].[Procedures]
ADD CONSTRAINT [FK_ProcedureTypeProcedure]
    FOREIGN KEY ([TypeId])
    REFERENCES [dbo].[ProcedureTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedureTypeProcedure'
CREATE INDEX [IX_FK_ProcedureTypeProcedure]
ON [dbo].[Procedures]
    ([TypeId]);
GO

-- Creating foreign key on [Id] in table 'Users_Patient'
ALTER TABLE [dbo].[Users_Patient]
ADD CONSTRAINT [FK_Patient_inherits_User]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Documents_MessageAttachment'
ALTER TABLE [dbo].[Documents_MessageAttachment]
ADD CONSTRAINT [FK_MessageAttachment_inherits_Document]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Documents]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Documents_PatientDocument'
ALTER TABLE [dbo].[Documents_PatientDocument]
ADD CONSTRAINT [FK_PatientDocument_inherits_Document]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Documents]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Users_Admin'
ALTER TABLE [dbo].[Users_Admin]
ADD CONSTRAINT [FK_Admin_inherits_User]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Users_Agent'
ALTER TABLE [dbo].[Users_Agent]
ADD CONSTRAINT [FK_Agent_inherits_User]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Documents_SharedDocument'
ALTER TABLE [dbo].[Documents_SharedDocument]
ADD CONSTRAINT [FK_SharedDocument_inherits_Document]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Documents]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------