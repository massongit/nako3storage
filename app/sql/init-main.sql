/* nako3storage main database */
CREATE TABLE info (
  info_id     INTEGER PRIMARY KEY,
  key         TEXT,
  value       INTEGER DEFAULT 0,
  tag         TEXT DEFAULT ''
);

CREATE TABLE apps (
  app_id      INTEGER PRIMARY KEY,
  title       TEXT DEFAULT '(no title)',
  author      TEXT DEFAULT '(no name)',
  email       TEXT DEFAULT '',
  url         TEXT DEFAULT '',
  memo        TEXT DEFAULT '',
  material_id INTEGER DEFAULT 0,
  version     TEXT DEFAULT '',
  nakotype    TEXT DEFAULT 'wnako', /* wnako/cnako/text/json/base64 */
  tag         TEXT DEFAULT '',
  editkey     TEXT DEFAULT '', /* 編集用のキー(ハッシュ化されて保存される) */
  need_key    INTEGER DEFAULT 0, /* 0:不要 1: 見るには access_keyが必要 */
  access_key  TEXT DEFAULT '', /* 閲覧用のキー(ハッシュ化されない) */
  is_private  INTEGER DEFAULT 0, /* 0:public 1:private */
  ref_id      INTEGER DEFAULT 0,
  ip          TEXT DEFAULT '',
  fav         INTEGER DEFAULT 0, /* いいね */
  view        INTEGER DEFAULT 0, /* 閲覧数 */
  canvas_w    INTEGER DEFAULT 300,
  canvas_h    INTEGER DEFAULT 300,
  ctime       INTEGER DEFAULT 0,
  mtime       INTEGER DEFAULT 0
);
/* 2020/12/05
ALTER TABLE apps ADD COLUMN canvas_w INTEGER DEFAULT 300;
ALTER TABLE apps ADD COLUMN canvas_h INTEGER DEFAULT 300;
*/

CREATE TABLE comments (
  comment_id    INTEGER PRIMARY KEY,
  app_id       INTEGER DEFAULT -1,
  name          TEXT DEFAULT '',
  body          TEXT DEFAULT '',
  ip            TEXT DEFAULT '',
  editkey       TEXT DEFAULT '',
  ctime         INTEGER DEFAULT 0,
  mtime         INTEGER DEFAULT 0
);
