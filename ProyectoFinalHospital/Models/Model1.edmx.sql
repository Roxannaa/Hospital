
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/06/2020 23:55:08
-- Generated from EDMX file: C:\Users\Roxanna\Desktop\2020-C1\Programación III\Final\Hospital\ProyectoFinalHospital\ProyectoFinalHospital\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HospitalSystem];
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

-- Creating table 'Medicos'
CREATE TABLE [dbo].[Medicos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Exequatur] nvarchar(max)  NOT NULL,
    [Especialidad] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Pacientes'
CREATE TABLE [dbo].[Pacientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cedula] nvarchar(max)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Asegurado] bit  NOT NULL
);
GO

-- Creating table 'Habitaciones'
CREATE TABLE [dbo].[Habitaciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Numero] int  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [Precioxdia] int  NOT NULL
);
GO

-- Creating table 'Citas'
CREATE TABLE [dbo].[Citas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Hora] time  NOT NULL,
    [MedicosId] int  NOT NULL
);
GO

-- Creating table 'Ingresos'
CREATE TABLE [dbo].[Ingresos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FechaIngreso] nvarchar(max)  NOT NULL,
    [HabitacionesId] int  NOT NULL,
    [PacientesId] int  NOT NULL,
    [Alta_Id] int  NOT NULL
);
GO

-- Creating table 'Altas'
CREATE TABLE [dbo].[Altas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [IdIngreso] nvarchar(max)  NOT NULL,
    [FechaSalida] datetime  NOT NULL,
    [MontoPagar] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Medicos'
ALTER TABLE [dbo].[Medicos]
ADD CONSTRAINT [PK_Medicos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pacientes'
ALTER TABLE [dbo].[Pacientes]
ADD CONSTRAINT [PK_Pacientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Habitaciones'
ALTER TABLE [dbo].[Habitaciones]
ADD CONSTRAINT [PK_Habitaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Citas'
ALTER TABLE [dbo].[Citas]
ADD CONSTRAINT [PK_Citas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ingresos'
ALTER TABLE [dbo].[Ingresos]
ADD CONSTRAINT [PK_Ingresos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Altas'
ALTER TABLE [dbo].[Altas]
ADD CONSTRAINT [PK_Altas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MedicosId] in table 'Citas'
ALTER TABLE [dbo].[Citas]
ADD CONSTRAINT [FK_MedicosCitas]
    FOREIGN KEY ([MedicosId])
    REFERENCES [dbo].[Medicos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MedicosCitas'
CREATE INDEX [IX_FK_MedicosCitas]
ON [dbo].[Citas]
    ([MedicosId]);
GO

-- Creating foreign key on [HabitacionesId] in table 'Ingresos'
ALTER TABLE [dbo].[Ingresos]
ADD CONSTRAINT [FK_HabitacionesIngresos]
    FOREIGN KEY ([HabitacionesId])
    REFERENCES [dbo].[Habitaciones]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HabitacionesIngresos'
CREATE INDEX [IX_FK_HabitacionesIngresos]
ON [dbo].[Ingresos]
    ([HabitacionesId]);
GO

-- Creating foreign key on [PacientesId] in table 'Ingresos'
ALTER TABLE [dbo].[Ingresos]
ADD CONSTRAINT [FK_PacientesIngresos]
    FOREIGN KEY ([PacientesId])
    REFERENCES [dbo].[Pacientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PacientesIngresos'
CREATE INDEX [IX_FK_PacientesIngresos]
ON [dbo].[Ingresos]
    ([PacientesId]);
GO

-- Creating foreign key on [Alta_Id] in table 'Ingresos'
ALTER TABLE [dbo].[Ingresos]
ADD CONSTRAINT [FK_IngresosAltas]
    FOREIGN KEY ([Alta_Id])
    REFERENCES [dbo].[Altas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IngresosAltas'
CREATE INDEX [IX_FK_IngresosAltas]
ON [dbo].[Ingresos]
    ([Alta_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------