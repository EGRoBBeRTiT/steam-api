CREATE TABLE "Users" (
  "id" integer PRIMARY KEY
);

CREATE TABLE "Groups" (
  "id" integer PRIMARY KEY,
  "title" string,
  "abbreviation" string,
  "link" string,
  "language" string,
  "country" string,
  "avatar" string,
  "associate_game" string[],
  "favorite_games" string[],
  "admin_id" integer
);

CREATE TABLE "Rates" (
  "id" integer PRIMARY KEY,
  "value" boolean,
  "user_id" integer
);

CREATE TABLE "Comments" (
  "id" integer PRIMARY KEY,
  "created_at" date,
  "user_id" integer,
  "summary" string
);

CREATE TABLE "Group_Subscribers" (
  "id" integer PRIMARY KEY,
  "group_id" integer,
  "user_id" integer
);

CREATE TABLE "Permitions" (
  "id" integer PRIMARY KEY,
  "key" string
);

CREATE TABLE "Table_Permitions" (
  "id" integer PRIMARY KEY,
  "permission_id" integer,
  "group_id" integer,
  "value" string
);

CREATE TABLE "Group_History" (
  "id" integer PRIMARY KEY,
  "group_id" integer,
  "created_at" date,
  "user_id" integer,
  "action" string,
  "description" string
);

CREATE TABLE "Group_Requests" (
  "id" integer PRIMARY KEY,
  "group_id" integer,
  "user_id" integer
);

CREATE TABLE "Group_Announcements" (
  "id" integer PRIMARY KEY,
  "group_id" integer,
  "created_at" date,
  "updated_at" date,
  "title" string,
  "description" string,
  "user_id" integer
);

CREATE TABLE "Group_Announcements_Rates" (
  "id" integer PRIMARY KEY,
  "group_announcement_id" integer,
  "rate_id" integer
);

CREATE TABLE "Group_Announcements_Comments" (
  "id" integer PRIMARY KEY,
  "group_announcement_id" integer,
  "comment_id" integer
);

CREATE TABLE "Group_Discussions" (
  "id" integer PRIMARY KEY,
  "group_id" integer,
  "created_at" date,
  "updated_at" date,
  "title" string,
  "description" string,
  "user_id" integer
);

CREATE TABLE "Group_Discussions_Comments" (
  "id" integer PRIMARY KEY,
  "group_discussion_id" integer,
  "comment_id" integer
);

CREATE TABLE "Group_Events" (
  "id" integer PRIMARY KEY,
  "group_id" integer,
  "created_at" date,
  "updated_at" date,
  "event_date" date,
  "title" string,
  "description" string,
  "type" enum,
  "user_id" integer
);

CREATE TABLE "Group_Events_Comments" (
  "id" integer PRIMARY KEY,
  "group_event_id" integer,
  "comment_id" integer
);

CREATE TABLE "Group_Comments" (
  "id" integer PRIMARY KEY,
  "group_id" integer,
  "comment_id" integer
);

COMMENT ON TABLE "Users" IS 'См. задание, которое сделал Саша';

ALTER TABLE "Group_Subscribers" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");

ALTER TABLE "Group_Subscribers" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Table_Permitions" ADD FOREIGN KEY ("permission_id") REFERENCES "Permitions" ("id");

ALTER TABLE "Table_Permitions" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");

ALTER TABLE "Users" ADD FOREIGN KEY ("id") REFERENCES "Groups" ("admin_id");

ALTER TABLE "Group_History" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");

ALTER TABLE "Group_History" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Group_Requests" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");

ALTER TABLE "Group_Requests" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Group_Announcements" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");

ALTER TABLE "Group_Announcements" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Group_Announcements_Comments" ADD FOREIGN KEY ("group_announcement_id") REFERENCES "Group_Announcements" ("id");

ALTER TABLE "Comments" ADD FOREIGN KEY ("id") REFERENCES "Group_Announcements_Comments" ("comment_id");

ALTER TABLE "Group_Announcements_Rates" ADD FOREIGN KEY ("group_announcement_id") REFERENCES "Group_Announcements" ("id");

ALTER TABLE "Rates" ADD FOREIGN KEY ("id") REFERENCES "Group_Announcements_Rates" ("rate_id");

ALTER TABLE "Rates" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Group_Discussions" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");

ALTER TABLE "Group_Discussions" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Group_Discussions_Comments" ADD FOREIGN KEY ("group_discussion_id") REFERENCES "Group_Discussions" ("id");

ALTER TABLE "Comments" ADD FOREIGN KEY ("id") REFERENCES "Group_Discussions_Comments" ("comment_id");

ALTER TABLE "Group_Events" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");

ALTER TABLE "Group_Events" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Group_Events_Comments" ADD FOREIGN KEY ("group_event_id") REFERENCES "Group_Events" ("id");

ALTER TABLE "Comments" ADD FOREIGN KEY ("id") REFERENCES "Group_Events_Comments" ("comment_id");

ALTER TABLE "Group_Comments" ADD FOREIGN KEY ("group_id") REFERENCES "Groups" ("id");

ALTER TABLE "Comments" ADD FOREIGN KEY ("id") REFERENCES "Group_Comments" ("comment_id");
