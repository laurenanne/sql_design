CREATE TABLE "teams"(
    "id" BIGINT NOT NULL,
    "team_name" TEXT NOT NULL,
    "current_ranking" BIGINT NOT NULL
);
ALTER TABLE
    "teams" ADD PRIMARY KEY("id");
ALTER TABLE
    "teams" ADD CONSTRAINT "teams_current_ranking_unique" UNIQUE("current_ranking");
CREATE TABLE "goals"(
    "id" BIGINT NOT NULL,
    "player" TEXT NOT NULL,
    "match" TEXT NOT NULL,
    "player_id" BIGINT NOT NULL,
    "match_id" BIGINT NOT NULL
);
ALTER TABLE
    "goals" ADD PRIMARY KEY("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_player_id_unique" UNIQUE("player_id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_match_id_unique" UNIQUE("match_id");
CREATE TABLE "matches"(
    "id" BIGINT NOT NULL,
    "team1" TEXT NOT NULL,
    "team2" TEXT NOT NULL,
    "date_played" DATE NOT NULL
);
ALTER TABLE
    "matches" ADD PRIMARY KEY("id");
CREATE TABLE "players"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "team_name" TEXT NOT NULL,
    "team_id" BIGINT NOT NULL
);
ALTER TABLE
    "players" ADD PRIMARY KEY("id");
ALTER TABLE
    "players" ADD CONSTRAINT "players_team_id_unique" UNIQUE("team_id");
CREATE TABLE "referees"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "match_id" BIGINT NOT NULL
);
ALTER TABLE
    "referees" ADD PRIMARY KEY("id");
ALTER TABLE
    "referees" ADD CONSTRAINT "referees_match_id_unique" UNIQUE("match_id");
CREATE TABLE "seasons"(
    "id" BIGINT NOT NULL,
    "start_dates" DATE NOT NULL,
    "end_dates" DATE NOT NULL,
    "year" TEXT NOT NULL
);
ALTER TABLE
    "seasons" ADD PRIMARY KEY("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_player_id_foreign" FOREIGN KEY("player_id") REFERENCES "players"("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "matches"("id");
ALTER TABLE
    "players" ADD CONSTRAINT "players_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "teams"("id");
ALTER TABLE
    "referees" ADD CONSTRAINT "referees_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "matches"("id");