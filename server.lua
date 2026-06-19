local ESX = exports.es_extended:getSharedObject()

local JobMap = {
    sasp = 'sasp',
    lspd = 'police',
    bcsd = 'sheriff',
    hospital = 'ambulance',
    taxi = 'taxi',
    bennys = 'tuner',
    gov = 'government',
    WezelNews = 'news'
}

local function GetScoreboardData()
    local xPlayers = ESX.GetExtendedPlayers()

    local jobCounts = {
        sasp = 0,
        lspd = 0,
        bcsd = 0,
        hospital = 0,
        taxi = 0,
        bennys = 0,
        gov = 0,
        WezelNews = 0
    }

    for _, xPlayer in pairs(xPlayers) do
        if xPlayer.job then
            for key, jobName in pairs(JobMap) do
                if xPlayer.job.name == jobName then
                    jobCounts[key] += 1
                end
            end
        end
    end

    return {
        players = #xPlayers,
        jobs = jobCounts,
        discord = 'Discord : Discord.gg/wyvernstudio'
    }
end

RegisterNetEvent('wyvern_scoreboard:requestData', function()
    local src = source
    TriggerClientEvent('wyvern_scoreboard:update', src, GetScoreboardData())
end)
