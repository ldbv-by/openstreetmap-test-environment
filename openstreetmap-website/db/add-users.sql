/* JOSM User */
INSERT
  INTO users (email, id, pass_crypt, creation_time, display_name, data_public, description, home_lat, home_lon, home_zoom, pass_salt, email_valid, new_email, languages, status, terms_agreed, consider_pd, auth_uid, preferred_editor, terms_seen, description_format, changesets_count, traces_count, diary_entries_count, image_use_gravatar, auth_provider, home_tile, tou_agreed, diary_comments_count, note_comments_count, creation_address, home_location_name, company)
VALUES ('josm-user@example.com', '2', '$argon2id$v=19$m=65536,t=3,p=4$zmdKaaMWo2SIjlf8DDpr1g$n3poh0ZWYsMOqwM1W+aVb5L/WKq5nDcM2wsSmgPy/BU', '2025-08-13T08:37:12.204033', 'josm-user', 'true', '', NULL, NULL, '3', NULL, 'false', NULL, 'de-DE,de,en-US,en', 'confirmed', '2025-08-13T08:37:11.958249', 'false', NULL, NULL, 'true', 'markdown', '0', '0', '0', 'false', NULL, NULL, '2025-08-13T08:37:11.95828', '0', '0', '0.0.0.0', NULL, NULL);

INSERT
  INTO oauth_applications (id, owner_type, owner_id, name, uid, secret, redirect_uri, scopes, confidential, created_at, updated_at)
VALUES ('1', 'User', '2', 'JOSM-BVV', '8GwVpTkVP6IInajsPZ3_d1PqXSMJGJFIWTbbdEOu1gM', 'aef103135d2c83e2aa3790a53223df3b76030df5948603db477e8fdd11c31778', 'http://127.0.0.1:8111/oauth_authorization', 'read_prefs write_prefs write_diary write_api write_changeset_comments read_gpx write_gpx write_notes write_redactions write_blocks consume_messages send_messages openid', 'false', '2025-08-13T17:58:52.734997', '2025-08-13T17:58:52.734997');

INSERT
  INTO oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, created_at, revoked_at, scopes, code_challenge, code_challenge_method)
VALUES ('1', '2', '1', 'sskjs28tYUh-6ZeUsuJHlq4_OUmRmWKzvVEK2w7MikI', '600', 'http://127.0.0.1:8111/oauth_authorization', '2025-08-13T17:59:36.536572', '2025-08-13T17:59:38.866068', 'read_gpx write_gpx read_prefs write_prefs write_api write_notes', 'ySuwvkd5oi0kQJYihjMmH4I9bF58zTDvsKrJaXh1ST0', 'S256');

INSERT
  INTO oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes, previous_refresh_token)
VALUES ('1', '2', '1', '_aLsyhc-pD30GOis33yipFDt6B2733hPoxY4go8-Nt4', NULL, NULL, NULL, '2025-08-13T17:59:38.881453', 'read_gpx write_gpx read_prefs write_prefs write_api write_notes', '');

/* iD User (+ OAuth2 will be done in entrypoint.sh) */
INSERT
  INTO users (email, id, pass_crypt, creation_time, display_name, data_public, description, home_lat, home_lon, home_zoom, pass_salt, email_valid, new_email, languages, status, terms_agreed, consider_pd, auth_uid, preferred_editor, terms_seen, description_format, changesets_count, traces_count, diary_entries_count, image_use_gravatar, auth_provider, home_tile, tou_agreed, diary_comments_count, note_comments_count, creation_address, home_location_name, company)
VALUES ('iD-user@example.com', '3', '$argon2id$v=19$m=65536,t=3,p=4$zmdKaaMWo2SIjlf8DDpr1g$n3poh0ZWYsMOqwM1W+aVb5L/WKq5nDcM2wsSmgPy/BU', '2025-08-13T08:37:12.204033', 'iD-user', 'true', '', NULL, NULL, '3', NULL, 'false', NULL, 'de-DE,de,en-US,en', 'confirmed', '2025-08-13T08:37:11.958249', 'false', NULL, NULL, 'true', 'markdown', '0', '0', '0', 'false', NULL, NULL, '2025-08-13T08:37:11.95828', '0', '0', '0.0.0.0', NULL, NULL);
