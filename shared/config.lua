Config = {}
Config.Cooldown = 300 * 1000                   -- 5 minutes
Config.RobberyTime = 60 * 1000                 -- 1 minute
Config.RobberyReward = math.random(1000, 5000) -- 1000 - 5000 dollars
Config.Locale = "de"
Translation = {
    ["de"] = {
        ["started_robbery"] =
        "Du hast einen Raubüberfall gestartet! Die Polizei wurde alarmiert! Wenn du hier bleibst, bekommst du eine Belohnung!",
        ["stopped_robbery"] = "Du hast den Raubüberfall abgebrochen!",
        ["finished_robbery"] = "Du hast deine Belohnung erhalten! Lass uns gehen!",
        ["npc_died"] = "Du hast den Raubüberfall abgebrochen! (NPC ist gestorben)",
    },
    ["en"] = {
        ["started_robbery"] =
        "You started a robbery! The police has been alerted! If you stay here, you will get a reward!",
        ["stopped_robbery"] = "You stopped the robbery!",
        ["finished_robbery"] = "You received your reward! Lets go!",
        ["npc_died"] = "You stopped the robbery! (NPC died)",
    }
}
