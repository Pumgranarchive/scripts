DROP TABLE link;
DROP TABLE Tag;
DROP TABLE content;

CREATE TABLE Content (
       content_uri text CONSTRAINT pk_content PRIMARY KEY,
       title varchar(255),
       summary varchar(255)
);

CREATE TABLE Link (
       link_id bigserial CONSTRAINT pk_link PRIMARY KEY,
       origin_uri text,
       target_uri text,
       nature varchar(255),
       mark real,
       user_mark real
);

CREATE TABLE Tag (
       tag_id bigserial CONSTRAINT pk_tag PRIMARY KEY,
       content_uri text,
       subject varchar(255),
       mark real
);