
select *
from portfolioProject..CovidDeaths
order by 3,4

select *
from portfolioProject..CovidVaccinations
order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from portfolioProject..CovidDeaths
order by 1,2

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathsRate
from portfolioProject..CovidDeaths
order by 1,2

select location, date, total_cases, population, (total_cases/population)*100 as infectionRate
from portfolioProject..CovidDeaths
order by 1,2

select location, population, max(total_cases) as higestInfection, max((total_cases/population))*100 as infectionRate
from portfolioProject..CovidDeaths
group by location, population
order by infectionRate desc

select location, max(cast(total_deaths as int)) as higestDeath
from portfolioProject..CovidDeaths
where continent is not null
group by location
order by higestDeath desc

select location, max(cast(total_deaths as int)) as higestDeath
from portfolioProject..CovidDeaths
where continent is null
group by location
order by higestDeath desc

select sum(new_cases) as totalCases, sum(cast(new_deaths as int)) as totalDeath, (sum(cast(new_deaths as int))/sum(new_cases))*100 as deathsRate
from portfolioProject..CovidDeaths
where continent is not null
-- group by date
order by 1,2


select *
from portfolioProject..CovidDeaths cda
join portfolioProject..CovidVaccinations cva
	on cda.location = cva.location
	and cda.date = cva.date
where cda.continent is not null
