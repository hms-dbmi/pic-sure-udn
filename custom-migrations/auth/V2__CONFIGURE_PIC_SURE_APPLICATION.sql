--
-- table `access_rule`
--

INSERT INTO access_rule (uuid, name, description, rule, type, value, checkMapKeyOnly, checkMapNode, subAccessRuleParent_uuid, isGateAnyRelation, isEvaluateOnlyByGates) VALUES (0x9C8F727138B4473AB432CEFBD4713157,'HPDS Level 1','HPDS Counts','$..expectedResultType',1,'DATAFRAME',0x00,0x00,NULL,0x00,0x00);

--
-- table `application`
--

INSERT INTO application (uuid, description, enable, name, token, url) VALUES (0x6535DFDD869A4B2BAC5F26B95BFE3B04,'PIC-SURE API v2',0x01,'PIC-SURE-API-2','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQU0FNQV9BUFBMSUNBVElPTnw2NTM1ZGZkZC04NjlhLTRiMmItYWM1Zi0yNmI5NWJmZTNiMDQiLCJleHAiOjE1NTM4NjM5NTMsInVzZXJfaWQiOiJQU0FNQV9BUFBMSUNBVElPTnxQSUMtU1VSRS1BUEktMiIsImlhdCI6MTU1MjM5MjcyNH0.DQwzaEXT3STHhspPuSlHIUNS0BTI98grOKB60YeOIV0',NULL);
INSERT INTO application (uuid, description, enable, name, token, url) VALUES (0x69AE17EFC49F45A3BB78B115095749B0,'PIC-SURE API v2',0x01,'PIC-SURE-API','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQU0FNQV9BUFBMSUNBVElPTnw2OWFlMTdlZi1jNDlmLTQ1YTMtYmI3OC1iMTE1MDk1NzQ5YjAiLCJleHAiOjE1NTIyMjc1MTQsInVzZXJfaWQiOiJQU0FNQV9BUFBMSUNBVElPTnxQSUMtU1VSRS1BUEkiLCJpYXQiOjE1NTA3NTYyODV9.VE4h9VTQRx2IypGL9-cwidl_TdjNBRzFm4wF00Ud9DE',NULL);
INSERT INTO application (uuid, description, enable, name, token, url) VALUES (0x9924280F3737468E9EF2722A30CF2403,'PIC-SURE API v2',0x01,'PIC-SURE-API-5','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQU0FNQV9BUFBMSUNBVElPTnw5OTI0MjgwZi0zNzM3LTQ2OGUtOWVmMi03MjJhMzBjZjI0MDMiLCJpc3MiOiJiYXIiLCJleHAiOjE2NDU0NjA3MjMsImlhdCI6MTU1OTA2MDcyMywianRpIjoiRm9vIn0.n--ilEZx8arZ5JLGu8vlHqysWATYUWcToltUDwr-EMQ',NULL);
INSERT INTO application (uuid, description, enable, name, token, url) VALUES (0xB2D396CFD0DD40CABC17A5B725396BDC,'PIC-SURE API v2',0x01,'PIC-SURE-API-3','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQU0FNQV9BUFBMSUNBVElPTnxiMmQzOTZjZi1kMGRkLTQwY2EtYmMxNy1hNWI3MjUzOTZiZGMiLCJleHAiOjE1NTUzNDM1NjEsInVzZXJfaWQiOiJQU0FNQV9BUFBMSUNBVElPTnxQSUMtU1VSRS1BUEktMyIsImlhdCI6MTU1Mzg3MjMzMn0.lOeJ0w0YP8xbrkWubORHXEKjsJjn5s49qpgW_NkppP4',NULL);
INSERT INTO application (uuid, description, enable, name, token, url) VALUES (0xE309C79E07D74015A4DA4964F96946B1,'PIC-SURE-API v2',0x01,'PIC-SURE-API-6','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQU0FNQV9BUFBMSUNBVElPTnxlMzA5Yzc5ZS0wN2Q3LTQwMTUtYTRkYS00OTY0Zjk2OTQ2YjEiLCJleHAiOjE2MTIwMzY2NzEsInVzZXJfaWQiOiJQU0FNQV9BUFBMSUNBVElPTnxQSUMtU1VSRS1BUEktNiIsImlhdCI6MTU4MDUwMDY3MX0.La-dfcZDgBds_yvBs6Dx4FNdfQ1wgwe-qhdk_Mk-Cec','');
INSERT INTO application (uuid, description, enable, name, token, url) VALUES (0xE947678D8F9D43039DE34C0DF14033D2,'PIC-SURE API v2',0x01,'PIC-SURE-API-4','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQU0FNQV9BUFBMSUNBVElPTnxlOTQ3Njc4ZC04ZjlkLTQzMDMtOWRlMy00YzBkZjE0MDMzZDIiLCJleHAiOjE1NTY5MTM2MjAsInVzZXJfaWQiOiJQU0FNQV9BUFBMSUNBVElPTnxQSUMtU1VSRS1BUEktNCIsImlhdCI6MTU1NTQ0MjM5MX0.OSwN3xpTuClKtIFum5bPM1pSqe3bTn_YTk-Pet2XFto',NULL);

--
-- table `connection`
--

INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3AF916CD33CC11E992000EE78FE6DD46,'Boston Childrens Hospital','bch','samlp|','[{\"label\":\"BCH Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3AF9828033CC11E992000EE78FE6DD46,'Baylor','baylor','samlp|','[{\"label\":\"Baylor Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3AFA5E3933CC11E992000EE78FE6DD46,'Duke','duke','samlp|','[{\"label\":\"Duke Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3AFABA6D33CC11E992000EE78FE6DD46,'HMS','hms-it','samlp|','[{\"label\":\"HMS Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3B087CAF33CC11E992000EE78FE6DD46,'Mayo','mayo','samlp|mayo|','[{\"label\":\"Mayo Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3B08D96233CC11E992000EE78FE6DD46,'NIH','nih','samlp|','[{\"label\":\"NIH Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3B09344233CC11E992000EE78FE6DD46,'Stanford','stanford','samlp|','[{\"label\":\"Stanford Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3B17A7FE33CC11E992000EE78FE6DD46,'UAB','uab','samlp|uab|','[{\"label\":\"UAB Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3B18079333CC11E992000EE78FE6DD46,'UCLA','ucla','samlp|','[{\"label\":\"UCLA Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3B1863DE33CC11E992000EE78FE6DD46,'University of Washington','universityofwashington','samlp|universityofwashington|','[{\"label\":\"University of Washington Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3B26F2A133CC11E992000EE78FE6DD46,'Vanderbilt','vanderbilt','samlp|','[{\"label\":\"Vanderbilt Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x3B27AC6233CC11E992000EE78FE6DD46,'Washington University in St. Louis','wustl','samlp|wustl|','[{\"label\":\"Washington University in St. Louis Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x45506719392F11E992000EE78FE6DD46,'Username Password Authentication','Username-Password-Authentication','auth0|','[{\"label\":\"Username-Password-Authentication Email\", \"id\":\"email\"}]');
INSERT INTO connection (uuid, label, id, subprefix, requiredFields) VALUES (0x6DC35D47C7C64CA7BEB42EDAC5184E10,'Google','google-oauth2','google-oauth2','[{\"label\":\"Email\", \"id\":\"email\"}]');

--
-- table `privilege`
--

INSERT INTO privilege (uuid, description, name, application_id, queryScope, queryTemplate) VALUES (0x420D39FF71F14B60BBBDEF2BBAB297A2,'PIC-SURE Auth super admin for managing roles/privileges/application','SUPER_ADMIN',NULL,NULL,NULL);
INSERT INTO privilege (uuid, description, name, application_id, queryScope, queryTemplate) VALUES (0x556A3AB3351D48DB869C46DC38457F88,'PIC-SURE Auth admin for managing users/connections.','SYSTEM',NULL,NULL,NULL);
INSERT INTO privilege (uuid, description, name, application_id, queryScope, queryTemplate) VALUES (0x6A84396DAE8D4C61AA2D24835394F21D,'Privilege to manage users.','ADMIN',NULL,NULL,NULL);
INSERT INTO privilege (uuid, description, name, application_id, queryScope, queryTemplate) VALUES (0xE932AB5635014BDB840BE5D2C260C5E0,'User can manage access to PIC-SURE','PIC-SURE-2-ADMIN',NULL,NULL,NULL);
INSERT INTO privilege (uuid, description, name, application_id, queryScope, queryTemplate) VALUES (0xF50BCBB55C4D489EAE11D810BEF6D0EE,'Privilege to run any query from PIC-SURE resources.','PIC-SURE-2-ALL-QUERIES',0xE309C79E07D74015A4DA4964F96946B1,NULL,NULL);

--
-- table `role`
--

INSERT INTO role (uuid, name, description) VALUES (0x7F6883BD83AA44F0930A012A0D8B5221,'PIC-SURE Project Manager','Manages users and their access levels. ');
INSERT INTO role (uuid, name, description) VALUES (0xE01D73E6DA9844DF82C5B30189335FE3,'PIC-SURE Top Admin','PIC-SURE Auth Micro App Top admin including Admin and super Admin');
INSERT INTO role (uuid, name, description) VALUES (0xFEA46D3AF3F245FA8CAA4500DC83946E,'IRB Approved Researcher','User can perform subset queries as well as export data.');

--
-- table `role_privilege`
--

INSERT INTO role_privilege (role_id, privilege_id) VALUES (0xE01D73E6DA9844DF82C5B30189335FE3,0x420D39FF71F14B60BBBDEF2BBAB297A2);
INSERT INTO role_privilege (role_id, privilege_id) VALUES (0xE01D73E6DA9844DF82C5B30189335FE3,0x556A3AB3351D48DB869C46DC38457F88);
INSERT INTO role_privilege (role_id, privilege_id) VALUES (0x7F6883BD83AA44F0930A012A0D8B5221,0x6A84396DAE8D4C61AA2D24835394F21D);
INSERT INTO role_privilege (role_id, privilege_id) VALUES (0xE01D73E6DA9844DF82C5B30189335FE3,0x6A84396DAE8D4C61AA2D24835394F21D);
INSERT INTO role_privilege (role_id, privilege_id) VALUES (0x7F6883BD83AA44F0930A012A0D8B5221,0xE932AB5635014BDB840BE5D2C260C5E0);
INSERT INTO role_privilege (role_id, privilege_id) VALUES (0xE01D73E6DA9844DF82C5B30189335FE3,0xE932AB5635014BDB840BE5D2C260C5E0);
INSERT INTO role_privilege (role_id, privilege_id) VALUES (0xFEA46D3AF3F245FA8CAA4500DC83946E,0xF50BCBB55C4D489EAE11D810BEF6D0EE);
