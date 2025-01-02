create table cache
(
    `key`      varchar(255) not null
        primary key,
    value      mediumtext   not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table cache_locks
(
    `key`      varchar(255) not null
        primary key,
    owner      varchar(255) not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table durumlar
(
    id         bigint unsigned auto_increment
        primary key,
    ad         varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table failed_jobs
(
    id         bigint unsigned auto_increment
        primary key,
    uuid       varchar(255)                          not null,
    connection text                                  not null,
    queue      text                                  not null,
    payload    longtext                              not null,
    exception  longtext                              not null,
    failed_at  timestamp default current_timestamp() not null,
    constraint failed_jobs_uuid_unique
        unique (uuid)
)
    collate = utf8mb4_unicode_ci;

create table gorevler
(
    id               bigint unsigned auto_increment
        primary key,
    ad               varchar(255) not null,
    aciklama         text         null,
    baslangic_tarihi date         not null,
    bitis_tarihi     date         not null,
    created_at       timestamp    null,
    updated_at       timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table iletisim_sayfası
(
    id         bigint unsigned auto_increment
        primary key,
    ad         varchar(255) not null,
    soyad      varchar(255) not null,
    email      varchar(255) not null,
    mesaj      text         not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table job_batches
(
    id             varchar(255) not null
        primary key,
    name           varchar(255) not null,
    total_jobs     int          not null,
    pending_jobs   int          not null,
    failed_jobs    int          not null,
    failed_job_ids longtext     not null,
    options        mediumtext   null,
    cancelled_at   int          null,
    created_at     int          not null,
    finished_at    int          null
)
    collate = utf8mb4_unicode_ci;

create table jobs
(
    id           bigint unsigned auto_increment
        primary key,
    queue        varchar(255)     not null,
    payload      longtext         not null,
    attempts     tinyint unsigned not null,
    reserved_at  int unsigned     null,
    available_at int unsigned     not null,
    created_at   int unsigned     not null
)
    collate = utf8mb4_unicode_ci;

create index jobs_queue_index
    on jobs (queue);

create table kategoriler
(
    id         bigint unsigned auto_increment
        primary key,
    ad         varchar(255) not null,
    aciklama   text         null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table hedefler
(
    id               bigint unsigned auto_increment
        primary key,
    ad               varchar(255)    not null,
    kategori_id      bigint unsigned null,
    aciklama         text            null,
    baslangic_tarihi date            not null,
    bitis_tarihi     date            not null,
    created_at       timestamp       null,
    updated_at       timestamp       null,
    durum_id         bigint unsigned null,
    constraint hedefler_durum_id_foreign
        foreign key (durum_id) references durumlar (id)
            on delete set null,
    constraint hedefler_kategori_id_foreign
        foreign key (kategori_id) references kategoriler (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table kullanicilar
(
    id         bigint unsigned auto_increment
        primary key,
    ad         varchar(255)                            not null,
    email      varchar(255)                            not null,
    parola     varchar(255)                            not null,
    durum      enum ('aktif', 'pasif') default 'aktif' not null,
    created_at timestamp                               null,
    updated_at timestamp                               null,
    constraint kullanicilar_email_unique
        unique (email)
)
    collate = utf8mb4_unicode_ci;

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table motivasyon_sozleri
(
    id         bigint unsigned auto_increment
        primary key,
    soz        text         not null,
    yazar      varchar(255) null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table password_reset_tokens
(
    email      varchar(255) not null
        primary key,
    token      varchar(255) not null,
    created_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table sessions
(
    id            varchar(255)    not null
        primary key,
    user_id       bigint unsigned null,
    ip_address    varchar(45)     null,
    user_agent    text            null,
    payload       longtext        not null,
    last_activity int             not null
)
    collate = utf8mb4_unicode_ci;

create index sessions_last_activity_index
    on sessions (last_activity);

create index sessions_user_id_index
    on sessions (user_id);

create table users
(
    id                bigint unsigned auto_increment
        primary key,
    name              varchar(255) not null,
    email             varchar(255) not null,
    email_verified_at timestamp    null,
    password          varchar(255) not null,
    remember_token    varchar(100) null,
    created_at        timestamp    null,
    updated_at        timestamp    null,
    constraint users_email_unique
        unique (email)
)
    collate = utf8mb4_unicode_ci;


