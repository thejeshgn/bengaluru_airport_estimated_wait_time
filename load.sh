# Remove the DB
rm status.db

# Create DB
git-history file status.db status.json \
--branch master \
--full-versions \
--id key \
--convert '
response_data = json.loads(content)
data = response_data["data"]
keys = data.keys()
for key in keys:
    event = {}
    #print(key)
    event["key"] = key
    if "Queue" in data[key]:        
        event["Queue_QueueLength"] = data[key]["Queue"]["QueueLength"] if "QueueLength" in data[key]["Queue"] else None
        event["Queue_WaitDisplay"] = data[key]["Queue"]["WaitDisplay"] if "WaitDisplay" in data[key]["Queue"] else None
    else:
        event["Queue_QueueLength"] = None
        event["Queue_WaitDisplay"] = None
    if "Desk" in data[key]:
        event["Desk_QueueLength"] = data[key]["Desk"]["QueueLength"] if "QueueLength" in data[key]["Desk"] else None
        event["Desk_ProcessTime"] = data[key]["Desk"]["ProcessTime"] if "ProcessTime" in data[key]["Desk"] else None
    else:
        event["Desk_QueueLength"] = None
        event["Desk_ProcessTime"] = None
    #print(event)
    yield event
'
