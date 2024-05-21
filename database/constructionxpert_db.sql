create database constructionxpert_db;

use constructionxpert_db;

create table projects(
	project_id int primary key auto_increment not null,
    project_name varchar(255),
    project_desc text,
    start_date date,
    end_date date,
    budget double
);

create table tasks(
	task_id int primary key auto_increment key not null,
	project_id int,
    task_name varchar(255),
    task_desc text,
    start_date date,
    end_date date,
    task_status enum('PENDING', 'IN_PROGRESS', 'COMPLETED'),
    foreign key (project_id) references projects(project_id)
);

create table resources(
	resource_id int primary key auto_increment not null,
    task_id int,
	resource_name varchar(255),
    resource_type enum('TOOL', 'LABOR', 'EQUIPMENT', 'MATERIAL'),
    quantity int,
    supplier_name varchar(255),
    supplier_contact varchar(255),
    foreign key (task_id) references tasks(task_id)
);

USE constructionxpert_db;

INSERT INTO projects (project_name, project_desc, start_date, end_date, budget) VALUES
('Office Building Construction', 'Construction of a new office building in downtown.', '2024-01-15', '2024-12-31', 1500000.00),
('Residential Complex', 'Development of a residential complex with 50 apartments.', '2024-02-01', '2025-06-30', 3000000.00),
('Highway Expansion', 'Expansion of the existing highway to add two more lanes.', '2024-03-01', '2025-12-31', 5000000.00),
('Shopping Mall Renovation', 'Renovation and modernization of the shopping mall.', '2024-04-01', '2024-10-15', 1200000.00),
('Airport Terminal Upgrade', 'Upgrade of the existing airport terminal to increase capacity.', '2024-05-01', '2025-03-31', 4000000.00),
('Hospital Wing Construction', 'Construction of a new wing in the city hospital.', '2024-06-01', '2025-04-30', 2500000.00),
('University Campus Development', 'Development of new facilities and infrastructure for the university.', '2024-07-01', '2026-06-30', 10000000.00);
