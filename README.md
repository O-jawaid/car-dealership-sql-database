# Car Dealership Database

A relational database designed to manage vehicle inventory, service history, and customer search for a car dealership, built in Microsoft SQL Server.

## Overview

This project designs a relational database to support the core operations of a car dealership. The main goal is to help customers find the exact vehicle they want by searching and filtering on features (such as leather seats, GPS, Apple CarPlay, or Android Auto) as well as make, model, year, and mileage. Behind the scenes, the database tracks new and used vehicle inventory, the history of used vehicles (such as prior accidents), and customer service and maintenance records, including oil changes, tire replacements, and car washes.

The full system objectives and user requirements are covered in the project report.

## Schema

The database is organized around eight core tables: **Customer, Car, Inventory, Feature, Category, History, Service,** and **Maintenance**. Separating vehicle data, customer data, and service records lets each be queried and updated independently while staying connected through relational keys.

## Approach

- Designed a relational schema across the eight tables above to represent vehicles, features, service records, and customer data, along with the relationships between them
- Implemented the schema in Microsoft SQL Server using `CREATE` statements to define tables and constraints
- Populated the database using `INSERT` statements
- Wrote `SELECT` queries using joins, filtering, sorting, and aggregation across the schema to support multi-attribute search and reporting
- Documented the schema design with an entity-relationship diagram (ERD)

## Tools

Microsoft SQL Server, SQL

## Repository Contents

- [`car ddl_dml.sql`](./car%20ddl_dml.sql) — full SQL source, including schema creation, sample data, and queries, viewable directly on GitHub
- [`report.pdf`](./report.pdf) — full project report, including system objectives, user requirements, the ERD, and annotated query examples

## About This Project

This was completed as part of my B.S. in Data Science at the University of North Texas, as an exercise in relational database design and query development for a real-world business use case.
