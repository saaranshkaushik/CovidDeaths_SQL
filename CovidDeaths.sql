select * from Portfolio..CovidDeaths 
order by 3,4

--select data to use
select location, date, total_cases, new_cases, total_deaths, population 
from Portfolio..CovidDeaths 
order by 1,2

--total cases vs total deaths in india
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from Portfolio..CovidDeaths 
where location like '%india%'
order by 1,2

--total cases vs population
select location, date, population, total_cases, (total_cases/population)*100 as percent_population_infected
from Portfolio..CovidDeaths 
where location like '%india%'
order by 1,2

--Countries with highest infection rate compared to population
select location, population, max(total_cases) as highest_infection_count, max((total_cases/population))*100 as percent_population_infected
from Portfolio..CovidDeaths 
--where location like '%india%'
group by location, population
order by percent_population_infected desc

--Countries with highest death count per population
select location, max(cast(total_deaths as int)) as total_death_count
from Portfolio..CovidDeaths
where continent is not null
group by location
order by total_death_count desc


--Continents with highest death count per population 
select continent, max(cast(total_deaths as int)) as total_death_count
from Portfolio..CovidDeaths
where continent is not null 
group by continent
order by total_death_count desc 

--Global numbers
select date, sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as death_percentage
from Portfolio..CovidDeaths
where continent is not null 
group by date
order by 1,2




