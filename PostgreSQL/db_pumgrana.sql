DROP TABLE link;
DROP TABLE Tag;
DROP TABLE content;

CREATE TABLE Content (
       content_uri varchar(255) CONSTRAINT pk_content PRIMARY KEY,
       title varchar(255),
       summary text
);

CREATE TABLE Link (
       link_id int CONSTRAINT pk_link PRIMARY KEY,
       origin_uri varchar(255),
       target_uri varchar(255),
       nature varchar(255),
       mark float8,
       user_mark float8
);

CREATE TABLE Tag (
       tag_id int CONSTRAINT pk_tag PRIMARY KEY,
       content_uri varchar(255),
       subject varchar(255),
       mark float8
);