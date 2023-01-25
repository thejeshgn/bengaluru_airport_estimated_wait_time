select commit_at as "date_time", 
        iv.key, 
        iv.Queue_WaitDisplay,
        iv.Queue_QueueLength,
        iv.Desk_QueueLength,
        iv.Desk_ProcessTime
from 
    item_version as iv, 
    commits as c
where 
    iv._commit = c.id
order by date_time asc

-- Get the data for a specific key
select datetime(commit_at) as "date_time", 
        iv.key, 
        iv.Queue_WaitDisplay,
        iv.Queue_QueueLength,
        iv.Desk_QueueLength,
        iv.Desk_ProcessTime
from 
    item_version as iv, 
    commits as c
where 
    iv._commit = c.id and
    iv.key = "T1IM"
order by date_time asc


-- Get the data for a specific day
select datetime(commit_at) as "date_time", 
        iv.key, 
        iv.Queue_WaitDisplay,
        iv.Queue_QueueLength,
        iv.Desk_QueueLength,
        iv.Desk_ProcessTime
from 
    item_version as iv, 
    commits as c
where 
    iv._commit = c.id and
    iv.key = "T1IM" and
    date(date_time) = "2023-01-25"

-- Get the Domestic Airline specific data


-- Get the Intl Airline specific data 