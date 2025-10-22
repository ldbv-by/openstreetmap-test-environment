SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('oauth_access_grants_id_seq', (SELECT MAX(id) FROM oauth_access_grants));
SELECT setval('oauth_access_tokens_id_seq', (SELECT MAX(id) FROM oauth_access_tokens));
SELECT setval('oauth_applications_id_seq', (SELECT MAX(id) FROM oauth_applications));
SELECT setval('oauth_openid_requests_id_seq', (SELECT MAX(id) FROM oauth_openid_requests));
SELECT setval('current_nodes_id_seq', (SELECT MAX(id) FROM current_nodes));
SELECT setval('current_ways_id_seq', (SELECT MAX(id) FROM current_ways));
SELECT setval('current_relations_id_seq', (SELECT MAX(id) FROM current_relations));