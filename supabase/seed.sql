INSERT INTO auth.users (instance_id,
						id,
						aud,
						role,
						email,
						email_confirmed_at,
						last_sign_in_at,
						raw_app_meta_data,
						raw_user_meta_data,
						is_super_admin,
						created_at,
						updated_at,
						is_sso_user
					   ) VALUES
(
	'00000000-0000-0000-0000-000000000000',    
	'219b5a28-4a03-46f3-a239-a2165e9d685e',    
	'authenticated',   
	'authenticated',   
	'bertamini.matteo@gmail.com',              
	'2023-03-20 23:04:47.169948+00',   
	'2023-03-20 23:04:47.169948+00',   
	'{"provider": "google", "providers": ["google"]}', 
	'{"iss": "https://www.googleapis.com/userinfo/v2/me", "sub": "107742176374486518857", "name": "Matteo Bertuz", "email": "bertamini.matteo@gmail.com", "picture": "https://lh3.googleusercontent.com/a/AGNmyxah-kzEJl1XrECQX1lcGkkKji_LwPMYPShDtWAUj4Q=s96-c", "full_name": "Matteo Bertuz", "avatar_url": "https://lh3.googleusercontent.com/a/AGNmyxah-kzEJl1XrECQX1lcGkkKji_LwPMYPShDtWAUj4Q=s96-c", "provider_id": "107742176374486518857", "email_verified": true}',
	FALSE,     
	'2023-03-20 23:04:47.174002+00',           
		'2023-03-20 23:04:47.174002+00',           
	FALSE);


INSERT INTO auth.identities (id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at) VALUES('107742176374486518859','219b5a28-4a03-46f3-a239-a2165e9d685e', '{"iss": "https://www.googleapis.com/userinfo/v2/me", "sub": "107742176374486518857", "name": "Matteo Bertuz", "email": "bertamini.matteo@gmail.com", "picture": "https://lh3.googleusercontent.com/a/AGNmyxah-kzEJl1XrECQX1lcGkkKji_LwPMYPShDtWAUj4Q=s96-c", "full_name": "Matteo Bertuz", "avatar_url": "https://lh3.googleusercontent.com/a/AGNmyxah-kzEJl1XrECQX1lcGkkKji_LwPMYPShDtWAUj4Q=s96-c", "provider_id": "107742176374486518857", "email_verified": true}', 'google',  '2023-03-20 23:04:47.143394+00'   ,'2023-03-20 23:04:47.14342+00'    ,'2023-03-20 23:04:47.14342+00');

INSERT INTO "public"."calendars" ("id", "user_id", "name", "color", "background_slug", "updated_at", "created_at") VALUES (1, '219b5a28-4a03-46f3-a239-a2165e9d685e', 'Primer intento
', 'FF0000', 'bamboo@3x.png', '2023-03-18 00:12:00.587676+00', '2023-03-17 07:00:00+00');
