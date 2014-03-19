
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/19/2014 16:55:43
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Type] tinyint  NOT NULL
);
GO

-- Creating table 'Messages'
CREATE TABLE [dbo].[Messages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Subject] nvarchar(max)  NOT NULL,
    [Body] nvarchar(max)  NULL,
    [ToId] nvarchar(max)  NOT NULL,
    [FromId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Procedures'
CREATE TABLE [dbo].[Procedures] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'UserProcedures'
CREATE TABLE [dbo].[UserProcedures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PatientId] nvarchar(max)  NOT NULL,
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
    [Type] int  NOT NULL
);
GO

-- Creating table 'Users_Patient'
CREATE TABLE [dbo].[Users_Patient] (
    [Id] nvarchar(max)  NOT NULL
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
    [PatientId] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Users_Admin'
CREATE TABLE [dbo].[Users_Admin] (
    [Id] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Users_Agent'
CREATE TABLE [dbo].[Users_Agent] (
    [Id] nvarchar(max)  NOT NULL
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