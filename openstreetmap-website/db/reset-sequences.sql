SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
SELECT setval('current_nodes_id_seq', (SELECT MAX(id) FROM current_nodes));
SELECT setval('current_ways_id_seq', (SELECT MAX(id) FROM current_ways));
SELECT setval('current_relations_id_seq', (SELECT MAX(id) FROM current_relations));