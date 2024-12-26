
create table if not exists "SequelizeMeta"
(
    name varchar(255) not null
        primary key
);

create table if not exists posts
(
    content     varchar(5000),
    created_at  timestamp with time zone default CURRENT_TIMESTAMP                            not null,
    updated_at  timestamp with time zone,
    id          uuid                     default gen_random_uuid()                            not null
        constraint "posts_id_pk"
            primary key,
    created_by  uuid,
    updated_by  uuid
);


create table if not exists comments
(
    content     varchar(5000),
    created_at  timestamp with time zone default CURRENT_TIMESTAMP                            not null,
    updated_at  timestamp with time zone,
    id          uuid                     default gen_random_uuid()                            not null
        constraint "comments_id_pk"
            primary key,
    created_by  uuid,
    updated_by  uuid
);

CREATE TABLE IF NOT EXISTS outbox (
    id uuid default gen_random_uuid() not null primary key, -- id event generated
    request_id uuid NOT NULL,
    aggregate_id VARCHAR(255) NOT NULL, -- key message
    aggregate_type VARCHAR(255) NOT NULL, -- topic name
    type VARCHAR(255) NOT NULL, -- event name (state, eg: created|published|deleted)
    payload jsonb,
    updated_at timestamp with time zone default CURRENT_TIMESTAMP,
    created_at timestamp with time zone default CURRENT_TIMESTAMP
);