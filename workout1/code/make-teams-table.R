---
Title: "Making a 2018 NBA Data Table"
Description: "This script is meant to be used for data preparation to create a csv data file of NBA 2018 data."
Input: "https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2018/master/data/nba2018.csv"
Outputs: "../output/efficiency-summary.txt, ../data/teams-summary.txt" 
---

library(readr)
library(dplyr)
nba <- read_csv("https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2018/master/data/nba2018.csv")
nba$experience[nba$experience == "R"] = 0
nba$experience = as.integer(nba$experience)
nba$salary = nba$salary/1000000
levels(nba$position) <- c("center","power_fwd","small_fwd","shoot_guard","point_guard")
nba <- mutate(nba, missed_fg = field_goals_atts - field_goals)
nba <- mutate(nba, missed_ft = points1_atts - points1)
nba <- mutate(nba, rebounds = off_rebounds + def_rebounds)
nba <- mutate(nba, efficiency = (points + rebounds + assists + steals + blocks - missed_fg - missed_ft - turnovers) / games)
summary(nba$efficiency)
sink("../output/efficiency-summary.txt")
teams <- summarise(group_by(nba, team), sum(experience), sum(salary/1000000), sum(points3), sum(points2), sum(points1), sum(points), sum(off_rebounds), sum(def_rebounds), sum(assists), sum(steals), sum(blocks), sum(turnovers), sum(fouls), sum(efficiency))
sink("../data/teams-summary.txt")
write.csv(teams, file = "../data/nba2018-teams.csv")
