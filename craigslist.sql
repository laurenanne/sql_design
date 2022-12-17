CREATE TABLE "users"(
    "id" BIGINT NOT NULL,
    "user_name" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "preferred_region" TEXT NOT NULL,
    "password" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_user_name_unique" UNIQUE("user_name");
CREATE TABLE "posts"(
    "id" BIGINT NOT NULL,
    "region" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "category" TEXT NOT NULL
);
ALTER TABLE
    "posts" ADD PRIMARY KEY("id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_user_id_unique" UNIQUE("user_id");
ALTER TABLE
    "posts" ADD CONSTRAINT "posts_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");